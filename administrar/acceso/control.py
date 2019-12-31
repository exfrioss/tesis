from flask import Flask, jsonify, request, current_app
from app import app, db
from administrar.acceso.get_control import Control
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime, timedelta
from functools import wraps
import jwt
@app.route('/control', methods = ['POST'])
def control():
    email = request.get_json()['email']
    contrasenia = request.get_json()['password']
    print(email, contrasenia)
    getUser = Control.controlAcceso(email)
    passw = None
    for v in getUser:
        passw = v[12]
    if not check_password_hash(passw, contrasenia):
        print("Invalid credentials")
        evento = "Error Login"
        Control.loginUser(email, evento)
        return jsonify({ 'message': 'Invalid credentials', 'authenticated': False }), 401
    evento = "Login"
    Control.loginUser(email, evento)
    token = jwt.encode({
        'sub': email,
        'iat': datetime.utcnow(),
        'exp': datetime.utcnow() + timedelta(minutes=30)
        },
        current_app.config['SECRET_KEY'])
    return jsonify({'token':token.decode('UTF-8')})


def token_required(f):
    @wraps(f)
    def _verify(*args, **kwargs):
        auth_headers = request.headers.get('Authorization', '').split()

        invalid_msg = {
            'message': 'Token invalido. Es necesario registrarse o autenticarse',
            'authenticated': False
        }

        expired_msg = {
            'message': 'Token há experido, por favor vuelva a autenticarse....',
            'authenticated': False
        }

        if len(auth_headers) !=2:
            return jsonify(invalid_msg)

        try:
            token = auth_headers[1]
            data = jwt.decode(token, current_app.config['SECRET_KEY'])
            print(data['sub'])
            user = Control.controlAcceso(data['sub'])
            if not user:
                raise RuntimeError('USUAURIO NO ENCONTRADO')
            return f(user, *args, **kwargs)
        except jwt.ExpiredSignatureError:
            return jsonify(expired_msg)
        except (jwt.InvalidTokenError, Exception) as error:
            print(error)
            return jsonify(invalid_msg)
    return _verify