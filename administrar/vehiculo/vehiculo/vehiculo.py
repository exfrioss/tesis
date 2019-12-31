from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, render_template, db
from administrar.vehiculo.vehiculo.get_vehiculo import Vehiculo

@app.route("/vehiculosActivos")
def vehiculosActivos():
    getSeguro = Vehiculo.get_vehiculOn()
    obtenerDatosFormateados = Vehiculo.regularRespuesta(getSeguro)
    return jsonify({"vehiculo": obtenerDatosFormateados})

@app.route("/vehiculosInactivos")
def vehiculosInactivos():
    getDatos = Vehiculo.get_vehiculOff()
    obtenerDatosFormateados = Vehiculo.regularRespuesta(getDatos)
    return jsonify({"vehiculo": obtenerDatosFormateados})

@app.route("/addvehiculo", methods = ["POST"])
def addVehiculo():
    if request.method == "POST":
        codigo = request.get_json()["codigo"]
        chasis = request.get_json()["chasis"]
        nroMotor = request.get_json()["nroMotor"]
        idTipo = request.get_json()["idtipo"]
        codModelo = request.get_json()["idmodelo"]
        codMarca = request.get_json()["idmarca"]
        numeroSeguro = request.get_json()["idseguro"]
        insert_seguro = Vehiculo.addVehiculo(codigo, chasis, nroMotor, idTipo, codModelo, codMarca, numeroSeguro)
        getDatos = Vehiculo.get_vehiculOn()
        datosFormateados= Vehiculo.regularRespuesta(getDatos)
    return jsonify({"vehiculo": datosFormateados})

@app.route("/updatevehiculo", methods = ["PUT"])
def updatevehiculo():
    codigo = request.get_json()["codigo"]
    chasis = request.get_json()["chasis"]
    nroMotor = request.get_json()["nroMotor"]
    idTipo = request.get_json()["idtipo"]
    codModelo = request.get_json()["idmodelo"]
    codMarca = request.get_json()["idmarca"]
    numeroSeguro = request.get_json()["idseguro"]
    estado = request.get_json()["estado"]
    update_vehiculo = Vehiculo.update_vehiculo(codigo, chasis, nroMotor, estado, idTipo, codModelo, codMarca, numeroSeguro)
    getDatos = Vehiculo.get_vehiculOn()
    getDatosFormateados = Vehiculo.regularRespuesta(getDatos)
    return jsonify({"vehiculo": getDatosFormateados})

@app.route("/deletevehiculo/<id>", methods = ["PUT"])
def deletevehiculo(id):
    print("Recibiendo parametro: ",id)
    deleteData = Vehiculo.delete_vehiculo(id)
    print(deleteData)
    getDatos = Vehiculo.get_vehiculOn()
    getDatosFormateados = Vehiculo.regularRespuesta(getDatos)
    return jsonify({"vehiculo": getDatosFormateados})


