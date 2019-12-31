from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, render_template, db
from administrar.vehiculo.seguro.get_seguro import Seguro

@app.route("/segurosActivos")
def seguroActivos():
    getSeguro = Seguro.get_segurOn()
    obtenerDatosFormateados = Seguro.regularRespuesta(getSeguro)
    return jsonify({"seguro": obtenerDatosFormateados})

@app.route("/segurosInactivos")
def segurosInactivos():
    getDatos = Seguro.get_segurOff()
    obtenerDatosFormateados = Seguro.regularRespuesta(getDatos)
    return jsonify({"seguro": obtenerDatosFormateados})

@app.route("/addseguro", methods = ["POST"])
def addSeguro():
    if request.method == "POST":
        codigo = request.get_json()["codigo"]
        descripcion = request.get_json()["descripcion"]
        fechaI = request.get_json()["fechaI"]
        fechaF = request.get_json()["fechaF"]
        costo = request.get_json()["costo"]
        insert_seguro = Seguro.addSeguro(codigo, descripcion, fechaI, fechaF, costo)
        getDatos = Seguro.get_segurOn()
        datosFormateados= Seguro.regularRespuesta(getDatos)
    return jsonify({"seguro": datosFormateados})

@app.route("/updateseguro", methods = ["PUT"])
def updateSeguro():
    codigo = request.get_json()["codigo"]
    descripcion = request.get_json()["descripcion"]
    fechaI = request.get_json()["fechaI"]
    fechaF = request.get_json()["fechaF"]
    costo = request.get_json()["costo"]
    estado = request.get_json()["estado"]
    update_seguro = Seguro.update_seguro(codigo, descripcion, fechaI, fechaF, costo, estado)
    getDatos = Seguro.get_segurOn()
    getDatosFormateados = Seguro.regularRespuesta(getDatos)
    return jsonify({"seguro": getDatosFormateados})

@app.route("/deleteseguro/<id>", methods = ["PUT"])
def deleteSeguro(id):
    print(id)
    deleteData = Seguro.delete_seguro(id)
    getDatos = Seguro.get_segurOn()
    getDatosFormateados = Seguro.regularRespuesta(getDatos)
    return jsonify({"seguro": getDatosFormateados})


