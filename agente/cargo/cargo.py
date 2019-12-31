from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, render_template, db
from agente.cargo.get_cargo import Cargo
# from runApp import db

@app.route('/cargo')
def cargo():
    dta = Cargo.get_cargo()
    cargos = []
    cargo = None
    if dta:
        print(dta)
    try:
        for c in dta:
                codigo = c[0]
                descripcion = c[1]
                estado = c[2]
                cargo = {
                        'codigo': codigo,
                        'descripcion': descripcion,
                        'estado': estado
                    }
                cargos.append(cargo)
        return jsonify({
                'cargo': cargos
    })
    except:
        return jsonify({'error': 'Error al obtener datos'})


@app.route('/add_cargo/<usuario>', methods=['POST'])
def add_cargo(usuario):
    if request.method == 'POST':
        descripcion = request.get_json()['descripcion']
        # codcargo = request.get_json()['codigo']
        print(descripcion)
        # resultBeInsert = Cargo.get_cargoBy_Id(codregion)
        # print(resultBeInsert)
        # if(resultBeInsert):
        #     print(resultBeInsert)
        # else:
        message = Cargo.insert_cargo(descripcion, usuario)
        # cod_region = {"codregion": codregion}
        descripcion = {"descripcion": descripcion}
        print(message)
        return jsonify({'descripcion': descripcion})


# @app.route('/validarCod', methods=['GET', 'POST'])
# def ValidarR():
#     if request.method == 'POST':
#         codR = request.get_json()['codregion']
#         print(codR)
#         result = _Region.get_regionBy_Id(codR)
#         result = {'result': result}
#         return jsonify(result)


@app.route('/update_cargo/<usuario>', methods=['PUT'])
def update_cargo(usuario):
    descripcion = request.get_json()['descripcion']
    estado = request.get_json()['estado']
    codcargo = request.get_json()['codigo']
    q = Cargo.update_cargo(codcargo, descripcion, estado, usuario)
    result = {"descripcion": descripcion, "estado": estado}
    print(q)
    return ({'result': result})


@app.route('/delete/<string:id>', methods=['PUT'])
def delet_cargo(id):
        resultBeDelet = Cargo.update_state(id)
        mess = Cargo.update_state(id)
        print(mess)
        return "hola mundo"

@app.route("/getCargoChofer")
def getCargoChofer():
        cod = None
        getData = Cargo.get_cargoChofer()
        for c in getData:
                cod = c[0]
        message = "HOLA"
        return jsonify(cod)
