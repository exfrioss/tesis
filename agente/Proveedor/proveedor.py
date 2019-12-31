from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, db
from localidades.ciudad.get_ciudad import _Ciudad
from agente.Proveedor.get_proveedor import Proveedor
import time


@app.route("/proveedor")
def proveedor():
    # city = _Ciudad.get_ciudadOn()
    prov = Proveedor.get_proveedor()
    listProveedor = []
    proveedor = None
    try:
        for e in prov:
            codigo = e[0]
            ruc = e[1]
            razonSocial = e[2]
            direccion = e[3]
            telefono = e[4]
            email = e[5]
            fechaI = e[6]
            fechaU = e[7]
            nombreContacto = e[8]
            telefonoContacto = e[9]
            estado = e[10]
            city = e[11]
            proveedor = {
                'codigo': codigo,
                'ruc': ruc,
                'razonSocial': razonSocial,
                'direccion': direccion,
                'telefono': telefono,
                'email': email,
                'fechaI': fechaI,
                'fechaU': fechaU,
                'nombreContacto': nombreContacto,
                'telefonoContacto': telefonoContacto,
                'estado': estado,
                'city': city
            }
            listProveedor.append(proveedor)
        return jsonify({"proveedor": listProveedor, "message": "success"})
    except:
        return jsonify({"message": 'Error al obtener datos de los empleados'})


@app.route("/proveedorbyId/<id>")
def proveedorbyId(id):
    # city = _Ciudad.get_ciudadOn()
    prov = Proveedor.getProveedorById(id)
    listProveedor = []
    proveedor = None
    try:
        for e in prov:
            codigo = e[0]
            ruc = e[1]
            razonSocial = e[2]
            direccion = e[3]
            telefono = e[4]
            email = e[5]
            fechaI = e[6]
            fechaU = e[7]
            nombreContacto = e[8]
            telefonoContacto = e[9]
            estado = e[10]
            city = e[11]
            proveedor = {
                'codigo': codigo,
                'ruc': ruc,
                'razonSocial': razonSocial,
                'direccion': direccion,
                'telefono': telefono,
                'email': email,
                'fechaI': fechaI,
                'fechaU': fechaU,
                'nombreContacto': nombreContacto,
                'telefonoContacto': telefonoContacto,
                'estado': estado,
                'city': city
            }
            listProveedor.append(proveedor)
        return jsonify({"proveedor": listProveedor, "message": "success"})
    except:
        return jsonify({"message": 'Error al obtener datos de los empleados'})


@app.route('/delete_proveedor/<string:usuario>', methods=['PUT'])
def delete_proveedor(usuario):
                id = request.get_json()["codigo"]
                print("codproveedor: '" + str(id) + "'")
                message = Proveedor.delete_proveedor(id, usuario)
                print(message)
                return ({'message': message})


@app.route('/add_proveedor/<usuario>', methods=['POST'])
def add_proveedor(usuario):
    if request.method == 'POST':
        codigo = request.get_json()['codigo']
        print(codigo)
        ruc = request.get_json()['ruc']
        print(ruc)
        razonSocial = request.get_json()['razonSocial']
        print(razonSocial)
        # lastname = request.get_json()['apellido']
        # print(lastname)
        address = request.get_json()['direccion']
        print(address)
        email = request.get_json()['email']
        print(email)
        city = request.get_json()['ciudad']
        print(city)
        numberphone = request.get_json()['telefono']
        print(numberphone)
        fechaI = request.get_json()['fechaI']
        print(fechaI)
        nombreContacto = request.get_json()['nombreContacto']
        telefonoContacto = request.get_json()['telefonoContacto']
        print(nombreContacto)
        # sex = request.get_json()['sexo']
        # print(sex)
        # sex = "M"
        today = time.strftime("%d-%m-%y")
        message = Proveedor.insert_proveedor(
            codigo, ruc, razonSocial, address, numberphone, email,  fechaI, today, nombreContacto, telefonoContacto, city, usuario)
        print(message)
        # flash(message)
        return jsonify({'message: ': 'message'})


@app.route('/update_proveedor/<string:usuario>', methods=['POST'])
def update_proveedor(usuario):
        if request.method == 'POST':
            codigo = request.get_json()['codigo']
            print(codigo)
            ruc = request.get_json()['ruc']
            print(ruc)
            razonSocial = request.get_json()['razonSocial']
            print(razonSocial)
            # lastname = request.get_json()['apellido'] 
            # print(lastname)
            address = request.get_json()['direccion']
            print(address)
            email = request.get_json()['email']
            print(email)
            city = request.get_json()['ciudad']
            print(city)
            numberphone = request.get_json()['telefono']
            print(numberphone)
            fechaI = request.get_json()['fechaI']
            print(fechaI)
            nombreContacto = request.get_json()['nombreContacto']
            print(nombreContacto)
            state = request.form['estado']
            if(state):
                state = '1'
            else:
                state = '0'
            message = Proveedor.update_proveedor(
                codigo, ruc, razonSocial, address, numberphone, estado, email, fechaI, today, nombrecontacto, city, usuario)
            print(message)
            return jsonify({'message': message})
