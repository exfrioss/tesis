from flask import Flask, jsonify, request
from administrar.proveedor.insumo.get_insumo import Insumo
from app import app, db


@app.route("/insumo")
def getInsumo():
    getinsumo = Insumo.getInsumo()
    listaFormateada = Insumo.formatearDatos(getinsumo)
    return jsonify({"insumo": listaFormateada})

@app.route("/insumominimo")
def getInsumominimo():
    getinsumo = Insumo.getInsumoStockMinimo()
    listaFormateada = Insumo.formatearDatos(getinsumo)
    return jsonify({"insumo": listaFormateada})

@app.route("/findinsumobyid/<codigo>")
def findinsumobyid(codigo):
        foundInsumo = Insumo.getInsumoById(codigo)
        listaFormateada = Insumo.formatearDatos(foundInsumo)
        return jsonify({"insumo": listaFormateada})

@app.route('/deleteinsumo', methods=['PUT'])
def deleteinsumo():
    usuario = request.get_json()['usuario'],
    id = request.get_json()['codigo']
    deleteInsumo = Insumo.deleteInsumo(id, usuario)
    getinsumo = Insumo.getInsumo()
    listaFormateada = Insumo.formatearDatos(getinsumo)
    return jsonify({"insumo": listaFormateada})

@app.route('/addinsumo', methods = ['POST'])
def addinsumo():
    if request.method == 'POST':
        cod_insumo = request.get_json()['codigo']
        descripcion = request.get_json()['descripcion']
        precio = request.get_json()['precio']
        iva = request.get_json()['iva']
        stock_ideal = request.get_json()['stockI']
        stock_minimo = request.get_json()['stockM']
        usuario = request.get_json()['usuario']
        # foundInsumo = Insumo.getInsumoById(cod_insumo)
        # print(foundInsumo)
        # if(foundInsumo):
        #     return jsonify({'message_Error': 'El registro ya se encuentra en uso'})
        # else:
        insertInsumo = Insumo.insertInsumo(cod_insumo, descripcion, precio, iva, stock_ideal, stock_minimo, usuario)
        print(insertInsumo)
        getinsumo = Insumo.getInsumo()
        listaFormateada = Insumo.formatearDatos(getinsumo)
        return jsonify(listaFormateada) 

@app.route('/updateinsumo/<id>', methods=['PUT'])
def updateinsumo(id):
    cod_insumo = request.get_json()['codigo']
    descripcion = request.get_json()['descripcion']
    precio = request.get_json()['precio']
    iva = request.get_json()['iva']
    stock_actual = request.get_json()['stockA']
    estado = request.get_json()['estado']
    stock_ideal = request.get_json()['stockI']
    stock_minimo = request.get_json()['stockM']
    usuario = request.get_json()["usuario"]

    updateInsumo = Insumo.updateInsumo(cod_insumo, descripcion, precio, iva, estado, stock_actual, stock_ideal, stock_minimo, usuario)
    getinsumo = Insumo.getInsumo()
    listaFormateada = Insumo.formatearDatos(getinsumo)
    return jsonify(listaFormateada)

@app.route("/findbyid/<codigo>")
def findbyid(codigo):
        foundInsumo = Insumo.getInsumoById(codigo)
        listaFormateada = Insumo.formatearDatos(foundInsumo)
        return jsonify({"insumo": listaFormateada})
