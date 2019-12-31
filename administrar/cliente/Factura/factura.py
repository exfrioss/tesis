from flask import Flask, jsonify, request
from app import app
from agente.Personal.query_personal import Personal
from administrar.cliente.Factura.get_Factura import Factura

@app.route("/guardarfactura", methods=["POST"])
def guardarfactura():
    idPersonal = None
    nroFactura = request.get_json()["nrofactura"]
    fechaE = request.get_json()["fechaE"]
    chofer = request.get_json()["chofer"]
    ci = request.get_json()["ci"]
    usuario = request.get_json()["usuario"]
    idPedido = request.get_json()["idPedido"]
    talonario = request.get_json()["talonario"]
    total = request.get_json()["total"]
    
    codServicio = request.get_json()["codServicio"]
    cantidad = request.get_json()["cantidad"]
    precio = request.get_json()["precio"]
    pesoI = request.get_json()["pesoI"]
    pesoF = request.get_json()["pesoF"]
    subtotal = request.get_json()["subtotal"]
    tolerancia = request.get_json()["tolerancia"]
    iva5 = request.get_json()["iva5"]
    iva10 = request.get_json()["iva10"]
    getPersonal = Personal.getPersonalByEmail(usuario)
    for p in getPersonal:
        idPersonal = p[0]
        print(idPersonal)
    print("cabecera: ", nroFactura, fechaE, chofer, ci, idPersonal, idPedido, talonario, usuario, total)
    print("Detalle: ", nroFactura, codServicio, precio, pesoI, pesoF, subtotal, cantidad, tolerancia, iva5, iva10)
    Factura.guardarFactura(nroFactura, fechaE, chofer, ci, idPersonal, idPedido, talonario, usuario, total, codServicio, precio, pesoI, pesoF, subtotal, cantidad, tolerancia, iva5, iva10)
    message = "Recibido"
    return jsonify(message)