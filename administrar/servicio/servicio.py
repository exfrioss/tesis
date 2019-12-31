from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from app import app, render_template, db
from administrar.servicio.get_servicio import Servicio

@app.route("/serviciosActivos")
def serviciosActivos():
    getDatos = Servicio.get_serviciOn()
    obtenerDatosFormateados = Servicio.regularRespuesta(getDatos)
    return jsonify({"servicio": obtenerDatosFormateados})

@app.route("/serviciosInactivos")
def serviciosInactivos():
    getDatos = Servicio.get_serviciOff()
    obtenerDatosFormateados = Servicio.regularRespuesta(getDatos)
    return jsonify({"servicio": obtenerDatosFormateados})

@app.route("/addServicio", methods = ["POST"])
def addServicio():
    if request.method == "POST":
        codigo = request.get_json()["codigo"]
        descripcion = request.get_json()["descripcion"]
        precio = request.get_json()["precio"]
        iva = request.get_json()["iva"]
        lugarCarga = request.get_json()["origen"]
        lugarDestino = request.get_json()["destino"]
        idCiudadOrigen = request.get_json()["idOrigen"]
        idCiudadDestino = request.get_json()["idDestino"]
        estado = request.get_json()["estado"]
        idVehiculo = request.get_json()["idVehiculo"]
        insert = Servicio.addServicio(descripcion, precio, iva, lugarCarga, lugarDestino, idCiudadOrigen, idCiudadDestino, estado, idVehiculo)
        getDatos = Servicio.get_serviciOn()
        datosFormateados= Servicio.regularRespuesta(getDatos)
    return jsonify({"servicio": datosFormateados})

@app.route("/updateServicio", methods = ["PUT"])
def updateServicio():
    codigo = request.get_json()["codigo"]
    descripcion = request.get_json()["descripcion"]
    precio = request.get_json()["precio"]
    iva = request.get_json()["iva"]
    lugarCarga = request.get_json()["origen"]
    lugarDestino = request.get_json()["destino"]
    idCiudadOrigen = request.get_json()["idOrigen"]
    idCiudadDestino = request.get_json()["idDestino"]
    estado = request.get_json()["estado"]
    idVehiculo = request.get_json()["idVehiculo"]
    update_vehiculo = Servicio.update_servicio(codigo, descripcion, precio, iva, lugarCarga, lugarDestino, idCiudadOrigen, idCiudadDestino, estado, idVehiculo)
    getDatos = Servicio.get_serviciOn()
    getDatosFormateados = Servicio.regularRespuesta(getDatos)
    return jsonify({"servicio": getDatosFormateados})

@app.route("/deleteServicio/<id>", methods = ["PUT"])
def deleteServicio(id):
    print("Recibiendo parametro: ",id)
    deleteData = Servicio.delete_servicio(id)
    print(deleteData)
    getDatos = Servicio.get_serviciOn()
    getDatosFormateados = Servicio.regularRespuesta(getDatos)
    return jsonify({"servicio": getDatosFormateados})

@app.route("/insertarDetalle/<codServicio>", methods=["POST"])
def insertarDetalle(codServicio):
    if request.method == "POST":
        listInsumo = request.get_json('listToPedidoInsumo')
        setDatos = Servicio.insert_Insumo_in_Servicio(codServicio, listInsumo)
        message = "Ok"
        return jsonify(setDatos)
