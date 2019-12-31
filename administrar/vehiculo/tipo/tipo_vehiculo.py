from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, render_template, db
from administrar.vehiculo.tipo.get_tipo_Vehiculo import Tipo_Vehiculo

@app.route("/tiposActivos")
def tiposActivos():
    getSeguro = Tipo_Vehiculo.get_tipOn()
    obtenerDatosFormateados = Tipo_Vehiculo.regularRespuesta(getSeguro)
    return jsonify({"tipo": obtenerDatosFormateados})

@app.route("/tiposInactivos")
def tiposInactivos():
    getDatos = Tipo_Vehiculo.get_tipOff()
    obtenerDatosFormateados = Tipo_Vehiculo.regularRespuesta(getDatos)
    return jsonify({"tipo": obtenerDatosFormateados})

@app.route("/addtipo", methods = ["POST"])
def addTipo():
    if request.method == "POST":
        codigo = request.get_json()["codigo"]
        descripcion = request.get_json()["descripcion"]
        isAsociado = request.get_json()["isAsociado"]
        pesoNeto = request.get_json()["pesoNeto"]
        insert_seguro = Tipo_Vehiculo.addTipo(descripcion, pesoNeto, isAsociado)
        getDatos = Tipo_Vehiculo.get_tipOn()
        datosFormateados= Tipo_Vehiculo.regularRespuesta(getDatos)
    return jsonify({"tipo": datosFormateados})

@app.route("/updatetipo", methods = ["PUT"])
def updatetipo():
    codigo = request.get_json()["codigo"]
    descripcion = request.get_json()["descripcion"]
    isAsociado = request.get_json()["isAsociado"]
    pesoNeto = request.get_json()["pesoNeto"]
    estado = request.get_json()["estado"]
    update_seguro = Tipo_Vehiculo.update_tipo(codigo, descripcion, pesoNeto, isAsociado, estado)
    getDatos = Tipo_Vehiculo.get_tipOn()
    getDatosFormateados = Tipo_Vehiculo.regularRespuesta(getDatos)
    return jsonify({"tipo": getDatosFormateados})

@app.route("/deletetipo/<id>", methods = ["PUT"])
def deletetipo(id):
    print("Recibiendo parametro: ",id)
    deleteData = Tipo_Vehiculo.delete_tipo(id)
    print(deleteData)
    getDatos = Tipo_Vehiculo.get_tipOn()
    getDatosFormateados = Tipo_Vehiculo.regularRespuesta(getDatos)
    return jsonify({"tipo": getDatosFormateados})


