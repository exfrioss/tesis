from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, render_template, db
from localidades.region.get_region import _Region
# from runApp import db
@app.route('/')
def index():
    return jsonify('pong')


@app.route('/region')
def Region():
    dta = _Region.get_regionOn()
    getDatosFormateados= _Region.datosFormateados(dta)
    return jsonify({"region": getDatosFormateados})


@app.route('/region_depa')
def region_depa():
    dti = _Region.get_regionOff()
    return jsonify({'region': dti})


@app.route('/add_region/<usuario>', methods=['POST'])
def add_region(usuario):
    if request.method == 'POST':
        descripcion = request.get_json()['descripcion']
        codregion = request.get_json()['codigo']
        resultBeInsert = _Region.get_regionBy_Id(codregion)
        if(resultBeInsert):
                error_message= "El registro ya está siendo utilizado"
                print(error_message)
                return jsonify({"error_message": error_message})
        else:
            message = _Region.insert_region(codregion, descripcion, usuario)
            getDatos = _Region.get_regionOn()
            getDatosFormateados= _Region.datosFormateados(getDatos)
            return jsonify({"region":getDatosFormateados})


@app.route('/validarCod', methods=['GET', 'POST'])
def ValidarR():
    if request.method == 'POST':
        codR = request.get_json()['codregion']
        print(codR)
        result = _Region.get_regionBy_Id(codR)
        result = {'result': result}
        return jsonify(result)


@app.route('/update_region/<usuario>', methods=['PUT'])
def update_region(usuario):
        descripcion = request.get_json()['descripcion']
        estado = request.get_json()['estado']
        codregion = request.get_json()['codigo']
        q = _Region.update_region(codregion, descripcion, estado, usuario)
        getDatos = _Region.get_regionOn()
        getDatosFormateados = _Region.datosFormateados(getDatos)
        return jsonify({"region": getDatosFormateados})


@app.route('/deleteregion/<string:usuario>', methods=['PUT'])
def delet_region(usuario):
        id = request.get_json()["codigo"]
        resultBeDelet = _Region.get_regionBy_Id(id)
        mess = _Region.update_state(id, usuario)
        print(mess)
        getDatos = _Region.get_regionOn()
        getDatosFormateados= _Region.datosFormateados(getDatos)
        return jsonify({"region": getDatosFormateados})
