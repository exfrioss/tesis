from flask import Flask, jsonify, request
from app import app
from factura.ajusteFactura.get_talonario import Talonario
@app.route("/insertTalonario", methods=["POST"])
def insertTalonario():
    var = None
    codt = request.get_json()["codT"]
    codE = request.get_json()["CodE"]
    fechaI = request.get_json()["fechaI"]
    fechaF = request.get_json()["fechaF"]
    nroI = request.get_json()["nroI"]
    nroA = request.get_json()["nroA"]
    nroF = request.get_json()["nroF"]
    activo = request.get_json()["activo"]
    usuario = request.get_json()["usuario"]
    if activo==True:
        var = 1
    else:
        var = 0
    Talonario.insertTalonario(codt, codE, fechaI, fechaF, nroI, nroA, nroF, var, usuario)
    getDatos = Talonario.getTalonarioActivo()
    getDatosFormateados = Talonario.formatearDatos(getDatos)
    print(getDatosFormateados)
    return jsonify({"talonario": getDatosFormateados})

@app.route("/getTalonariosA")
def getTalonariosA():
    getDatos = Talonario.getTalonarioActivo()
    getDatosFormateados = Talonario.formatearDatos(getDatos)
    return jsonify({"talonario": getDatosFormateados})

@app.route("/getTalonariosInactivos")
def getTalonariosInactivos():
    getDatos = Talonario.getTalonarioInActivo()
    getDatosFormateados = Talonario.formatearDatos(getDatos)
    return jsonify({"talonario": getDatosFormateados})

@app.route("/getTheLastTalonarioActivo")
def getTheLastTalonarioActivo():
    getDatos = Talonario.getTheLastTalonarioActivo()
    getDatosFormateados = Talonario.formatearDatos(getDatos)
    return jsonify({"talonario": getDatosFormateados})