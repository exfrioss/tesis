from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, db
from localidades.ciudad.get_ciudad import _Ciudad
from agente.Personal.query_personal import Personal
from agente.cargo.get_cargo import Cargo
import time
from werkzeug.security import generate_password_hash, check_password_hash 


@app.route("/personal")
def personal():
        empl = Personal.get_personal()
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData})

@app.route("/usuarioSistema")
def usuarioSistema():
        empl = Personal.get_UsuarioSistema()
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData})

@app.route("/personalOn")
def personalOn():
        empl = Personal.get_personalOn()
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData})

@app.route("/personalOff")
def personalOff():
        empl = Personal.get_personalOff()
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData})



@app.route('/delete_employee/<string:usuario>', methods = ['PUT'])
def delete_employee(usuario):
        id = request.get_json()["codigo"]
        message = Personal.delete_employee(id, usuario)
        empl = Personal.get_personalOn()
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData})

@app.route('/add_employee/<usuario>', methods=['POST'])
def add_employee(usuario):
    if request.method == 'POST':
        print(usuario)
        # cpassword = None
        # personal = request.get_json()['ruc']
        # print(personal)
        ruc = request.get_json()['ruc']
        name = request.get_json()['nombre']
        lastname = request.get_json()['apellido']
        address = request.get_json()['direccion']
        email = request.get_json()['email']
        city = request.get_json()['city']
        numberphone = request.get_json()['telefono']
        birthday = request.get_json()['sfechaN']
        fingreso = request.get_json()['sfechaI']
        password = request.get_json()['password']
        cpassword = generate_password_hash(password, method='sha256')
        print(password, cpassword)
        cargo = request.get_json()['idcargo']
        isUsuario = request.get_json()['isUsuario']
        sex = request.get_json()['sexo']
        if isUsuario==True:
                esUsuario = '1'
        else:
                esUsuario = '0'
        today = time.strftime("%d-%m-%y")
        message = Personal.insert_employee(ruc, name, lastname, address, email, city, numberphone, birthday, fingreso ,today, esUsuario, cpassword, cargo, sex, usuario)
        empl = Personal.get_personal()
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData})


@app.route('/update_employee/<string:usuario>', methods = ['PUT'])
def update_employee(usuario):
        if request.method == 'PUT':
                id = request.get_json()['codigo']
                ruc = request.get_json()['ruc']
                name = request.get_json()['nombre']
                lastname = request.get_json()['apellido']
                address = request.get_json()['direccion']
                email = request.get_json()['email']
                city = request.get_json()['city']
                numberphone = request.get_json()['telefono']
                birthday = request.get_json()['sfechaN']
                # password = request.get_json()['password']
                cargo = request.get_json()['idcargo']
                isUsuario = request.get_json()['isUsuario']
                sex = request.get_json()['sexo']
                estado = request.get_json()['estado']
                if(estado):
                        state = '1'
                else:
                        state = '0'
                if(isUsuario):
                        esUsuario = '1'
                else: 
                        esUsuario = '0'
        message = Personal.update_employee(id, ruc, name, lastname, address, email, city, numberphone, birthday, cargo, sex, esUsuario, state, usuario)
        print(message)
        empl = Personal.get_personal()
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData}) 


@app.route("/personalbyid/<id>")
def personalbyid(id):
        empl = Personal.getPersonalById(id)
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData}) 


@app.route("/personalbyemail/<id>")
def personalbyemail(id):
        empl = Personal.getPersonalByEmail(id)
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData})

@app.route("/chofer")
def chofer():
        var = None
        codCargo = Cargo.get_cargoChofer()
        for c in codCargo:
                var = c[0]
        empl = Personal.get_Chofer(var)
        getData = Personal.datosFormateados(empl)
        return jsonify({"personal": getData}) 