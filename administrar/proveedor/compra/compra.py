from flask import Flask, jsonify, request
from administrar.proveedor.compra.get_compra import Compra
from agente.Proveedor.get_proveedor import Proveedor
from administrar.proveedor.insumo.get_insumo import Insumo
from app import app, db
from administrar.acceso.control import *

@app.route("/compras")
def compras():
    getcompras = Compra.getCompras()
    listCompras = Compra.setJsonCompras(getcompras)
    return jsonify(listCompras)

@app.route("/comprasAnuladas")
def comprasAnuladas():
    getcompras = Compra.getComprasAnulados()
    listCompras = Compra.setJsonCompras(getcompras)
    return jsonify(listCompras)

@app.route("/comprasfechas", methods = ["POST"])
def comprasfechas():
    if request.method == "POST":
        fechaDesde = request.get_json()["fechaD"]
        fechaHasta = request.get_json()["fechaH"]
        getcompras = Compra.filtrarCompra(fechaDesde, fechaHasta)
        listCompras = Compra.setJsonCompras(getcompras)
        return jsonify(listCompras)

@app.route("/comprasById/<factura>")
def getComprasById(factura):
    getcompras = Compra.getcomprasById(factura)
    listCompras = Compra.setJsonCompras(getcompras)
    return jsonify(listCompras)

@app.route("/anularfactura/<factura>", methods=["PUT"])
def anularfactura(factura):
    anularfactura = Compra.anularCompra(factura)
    getcompras = Compra.getCompras()
    listCompras = Compra.setJsonCompras(getcompras)
    return jsonify(listCompras)

@app.route("/insertcompras", methods=["POST"])
def insertcompras():
    if request.method == 'POST':
        iva5 = 0
        iva10 = 0
        idPedido = None
        total = 0
        detalle = []
        listDetalle = []
        ca = request.get_json('cabecera[]')
        print(ca)
        for value in ca:
            cabecera = value['cabecera']
            numeroFactura = cabecera['numeroFactura']
            fecha = cabecera['fechaC']
            idEmpleado = cabecera['selectpersonal']
            idproveedor = cabecera['selectProveedor']
            print(numeroFactura, fecha, idEmpleado, idproveedor)
            detalle = value['detalle']
            for d in detalle:
                cantidad = d['cantidad']
                codigo = d['idinsumo']
                subtotal = d['subTotal']
                precio = d['precioUnitario']
                idPedido = d['idpedido']
                getProducto = Insumo.getInsumoById(codigo)
                for iv in getProducto:
                    if iv[3] == 5:
                        iva5 = float(subtotal)/float(21)
                        # print(iva5)
                    else:
                        iva5 = 0
                    if iv[3] == 10:
                        iva10 = float(subtotal)/float(11)
                        # print(iva10)
                    else:
                        iva10 = 0
                    total = float(total) + float(subtotal)
                    # print('total', total)
                    # print(cantidad, codigo, subtotal, precio, numeroFactura, iva10, iva5)
                detalle = {
                    'cantidad':cantidad,
                    'codigo': codigo,
                    'subtotal': subtotal,
                    'precio' : precio,
                    'iva10': iva10,
                    'iva5': iva5,
                    'numeroFactura': numeroFactura
                }
                listDetalle.append(detalle)
        # for d in listDetalle:
            # ssss = d['cantidad']
            # print(" this is only a try", ssss)
        request_insert = Compra.insertCompra(numeroFactura, fecha, total, idproveedor, idPedido, idEmpleado, listDetalle)
        print(request_insert)
    else:
        print("Error WEY")
    message = "good job"
    return message

