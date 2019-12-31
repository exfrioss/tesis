from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from localidades.ciudad import get_ciudad
from localidades.departamento.get_departamento import _Depa
from app import app, db


@app.route('/ciudad')
def ciudad():
    resultOn = get_ciudad._Ciudad.get_CiudadOff()
    getData = get_ciudad._Ciudad.datosFormatedos(resultOn)
    return jsonify({"ciudad": getData})

@app.route('/ciudadOn')
def ciudadOn():
    resultOn = get_ciudad._Ciudad.get_ciudadOn()
    getData = get_ciudad._Ciudad.datosFormatedos(resultOn)
    return jsonify({"ciudad": getData})

@app.route('/add_ciudad/<usuario>', methods = ['POST'])
def add_ciudad(usuario):
        print(usuario)
        if request.method == 'POST':
                codigo = request.get_json()['codigo']
                dscp = request.get_json()['descripcion']
                depa = request.get_json()['departamento']
                uniqueResult = get_ciudad._Ciudad.get_cityBy_ID(codigo)
                if(uniqueResult):
                        return jsonify({'message_Error': 'El departamento ya se encuentra registrado'})
                else:
                        state = '1'
                        ok = get_ciudad._Ciudad.insert_city(codigo, dscp, depa, state, usuario)
                        resultOn = get_ciudad._Ciudad.get_CiudadOff()
                        getData = get_ciudad._Ciudad.datosFormatedos(resultOn)
                        return jsonify({"ciudad": getData})

@app.route('/validar_ciudad', methods = ['GET','POST'])
def validar_ciudad():
    if request.method == 'POST':
        codigo = request.get_json()['codigo']
        print(codigo)
        result = get_ciudad._Ciudad.get_cityBy_ID(codigo)
        print(result)
        # result = {'result': result}
        return jsonify({'result':result})

@app.route('/delete_ciudad/<string:usuario>', methods=['PUT'])
def delet_ciudad(usuario):
        print(usuario)
        codigo = request.get_json()['codigo']
        resultBeDelet = get_ciudad._Ciudad.delet_ciudad(codigo, usuario) 
        # mess = _Depa.delet_depa(id)
        resultOn = get_ciudad._Ciudad.get_CiudadOff()
        getData = get_ciudad._Ciudad.datosFormatedos(resultOn)
        return jsonify({"ciudad": getData})

@app.route('/update_ciudad/<usuario>', methods=['PUT'])
def update_ciudad(usuario):
        descripcion = request.get_json()['descripcion']
        estado = request.get_json()['estado']
        codigo = request.get_json()['codigo']
        print(codigo)
        depa = request.get_json()['departamento']
        q = get_ciudad._Ciudad.update_ciudad(codigo, descripcion, estado, depa, usuario)
        resultOn = get_ciudad._Ciudad.get_CiudadOff()
        getData = get_ciudad._Ciudad.datosFormatedos(resultOn)
        return jsonify({"ciudad": getData})