from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from localidades.ciudad.get_ciudad import _Ciudad
from agente.Cliente.query_cliente import Cliente
from app import app, db
import time
 

@app.route('/cliente')
def cliente(): 
        cl = Cliente.get_clienteOn()
        dataformateado = Cliente.datosFormateados(cl)
        return jsonify({"cliente": dataformateado})

@app.route('/clienteOn')
def clienteOn(): 
        cl = Cliente.get_cliente()
        dataformateado = Cliente.datosFormateados(cl)
        return jsonify({"cliente": dataformateado})

@app.route('/clienteOff')
def clienteOff(): 
        cl = Cliente.get_clienteOff()
        dataformateado = Cliente.datosFormateados(cl)
        return jsonify({"cliente": dataformateado})

@app.route('/delete_cliente/<string:usuario>', methods = ['PUT'])
def delete_cliente(usuario):
                id = request.get_json()["codigo"]
                print("ci_numero: '" + str(id) + "'")
                message = Cliente.delete_customer(id, usuario)
                cl = Cliente.get_cliente()
                dataformateado = Cliente.datosFormateados(cl)
                return jsonify({"cliente": dataformateado})

@app.route('/validar_cliente', methods = ['GET','POST'])
def validar_cliente():
    if request.method == 'POST':
        codigo = request.get_json()['codigo']
        print(codigo)
        result = Cliente.get_cliente_For_ID(codigo)
        print(result)
        return jsonify({'result':result})

@app.route('/add_cliente/<usuario>', methods=['POST'])
def add_cliente(usuario):
    if request.method == 'POST':
        cinumber = request.get_json()['codigo']
        ruc = request.get_json()['ruc']
        name = request.get_json()['nombre']
        lastname = request.get_json()['apellido']
        address = request.get_json()['direccion']
        email = request.get_json()['email']
        city = request.get_json()['ciudad']
        numberphone = request.get_json()['telefono']
        birthday = request.get_json()['fechaN']
        fechaInicio = request.get_json()['fechaI']
        sex = request.get_json()['sexo']
        password = request.get_json()['password']
        isUsuario = request.get_json()['isUsuario']
        if(isUsuario):
                esUsuario = '1'
        else:
                esUsuario = '0'
        today = time.strftime("%d-%m-%y")
        message = Cliente.insert_client(cinumber, ruc, name, lastname, address, email, city, numberphone, fechaInicio, birthday, sex, today, password, esUsuario, usuario)
        print(message)
        cl = Cliente.get_cliente()
        dataformateado = Cliente.datosFormateados(cl)
        return jsonify({"cliente": dataformateado})

@app.route('/update_cliente/<string:usuario>', methods = ['PUT'])
def update_cliente(usuario):
        if request.method == 'PUT':
                # cinumber = request.form['inputCiN']
                cinumber = request.get_json()['codigo']
                ruc = request.get_json()['ruc']
                name = request.get_json()['nombre']
                lastname = request.get_json()['apellido']
                address = request.get_json()['direccion']
                email = request.get_json()['email']
                city = request.get_json()['ciudad']
                numberphone = request.get_json()['telefono']
                birthday = request.get_json()['fechaN']
                fechaInicio = request.get_json()['fechaI']
                sex = request.get_json()['sexo']
                print(sex)
                password = request.get_json()['password']
                isUsuario = request.get_json()['isUsuario']
                state = request.get_json()['estado']
                if(state):
                        state = '1'
                else:
                        state = '0'

                if(isUsuario):
                        esUsuario = '1'
                else:
                        esUsuario = '0'

                # try:
                #         if request.form['check_Femenino'] == "F":
                #                 sexF = request.form['check_Femenino']
                #                 sex = sexF
                #         else:
                #                 sexM = request.form['check_Masculino']
                #                 sex = sexM
                # except:
                #         sexM = request.form['check_Masculino']
                #         sex = sexM
        message = Cliente.update_customer(cinumber, state, ruc, name, lastname, address, email, city, numberphone, birthday, fechaInicio, sex, password, esUsuario, usuario)
        cl = Cliente.get_cliente()
        dataformateado = Cliente.datosFormateados(cl)
        return jsonify({"cliente": dataformateado})