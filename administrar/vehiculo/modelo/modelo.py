from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, render_template, db
from administrar.vehiculo.modelo.get_modelo import Modelo

@app.route("/modelosActivos")
def modeloActivos():
    getModelo = Modelo.get_modeloOn()
    obtenerDatosFormateados = Modelo.regularRespuesta(getModelo)
    return jsonify({"modelo": obtenerDatosFormateados})

@app.route("/modelosInactivos")
def modelosInactivos():
    getModelosOff = Modelo.get_modeloOff()
    obtenerDatosFormateados = Modelo.regularRespuesta(getModelosOff)
    return jsonify({"modelo": obtenerDatosFormateados})

@app.route("/addModelo", methods = ["POST"])
def addModelo():
    if request.method == "POST":
        descripcion = request.get_json()["descripcion"]
        anio = request.get_json()["anio"]
        insert_modelo = Modelo.addModelo(anio, descripcion)
        getModelo = Modelo.get_modeloOn()
        datosFormateados= Modelo.regularRespuesta(getModelo)
    return jsonify({"modelo": datosFormateados})

@app.route("/updateModelo", methods = ["PUT"])
def updateModelo():
    descripcion = request.get_json()["descripcion"]
    print(descripcion)
    codigo = request.get_json()["codigo"]
    anio = request.get_json()["anio"]
    estado = request.get_json()["estado"]
    update_Modelo = Modelo.update_modelo(codigo, anio, descripcion, estado)
    getModelo = Modelo.get_modeloOn()
    getModeloFormateada = Modelo.regularRespuesta(getModelo)
    return jsonify({"modelo": getModeloFormateada})

@app.route("/deleteModelo/<id>", methods = ["PUT"])
def deleteModelo(id):
    print(id)
    deleteModelo = Modelo.delete_modelo(id)
    getModelo = Modelo.get_modeloOn()
    getModeloFormateada = Modelo.regularRespuesta(getModelo)
    return jsonify({"modelo": getModeloFormateada})


