from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, render_template, db
from administrar.vehiculo.marca.get_marca import Marca

@app.route("/marcasActivas")
def marcasActivas():
    getMarca = Marca.get_marcaOn()
    obtenerDatosFormateados = Marca.regularRespuesta(getMarca)
    return jsonify({"marca": obtenerDatosFormateados})

@app.route("/marcasInactivas")
def marcasInactivas():
    getMarcasOff = Marca.get_marcaOff()
    obtenerDatosFormateados = Marca.regularRespuesta(getMarcasOff)
    return jsonify({"marca": obtenerDatosFormateados})

@app.route("/addMarca", methods = ["POST"])
def addMarca():
    if request.method == "POST":
        descripcion = request.get_json()["descripcion"]
        insert_marca = Marca.addMarca(descripcion)
        getMraca = Marca.get_marcaOn()
        datosFormateados= Marca.regularRespuesta(getMraca)
    return jsonify({"marca": datosFormateados})

@app.route("/updateMarca/<id>", methods = ["PUT"])
def updateMarca(id):
    descripcion = request.get_json()["descripcion"]
    estado = request.get_json()["estado"]
    update_Marca = Marca.update_marca(id, descripcion, estado)
    getMarca = Marca.get_marcaOn()
    getMarcaFormateada = Marca.regularRespuesta(getMarca)
    return jsonify({"marca": getMarcaFormateada})

@app.route("/deleteMarca/<id>", methods = ["PUT"])
def deleteMarca(id):
    print(id)
    deleteMarca = Marca.delete_marca(id)
    getMarca = Marca.get_marcaOn()
    getMarcaFormateada = Marca.regularRespuesta(getMarca)
    return jsonify({"marca": getMarcaFormateada})


