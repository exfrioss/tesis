from flask import Flask, jsonify, request
from administrar.servicio.get_servicio import Servicio
from agente.Personal.query_personal import Personal
from agente.Cliente.query_cliente import Cliente
from app import app, db
from administrar.acceso.control import *
from administrar.cliente.PedidoServicio.get_pedidoCliente import PedidoCliente

@app.route("/insertPedidoCliente", methods = ['POST'])
def insertPedidoCliente():
    if request.method == "POST":
        idEmpleado = None
        fechaP = request.get_json()["fechaP"]
        print(fechaP)
        idCliente = request.get_json()["codCliente"]
        usuario = request.get_json()["idEmpleado"]
        fechaE = request.get_json()["fechaE"]
        print("fechaE", fechaE)
        getEmpleado = Personal.getPersonalByEmail(usuario)
        for e in getEmpleado:
                idEmpleado = e[0]
        codServicio = request.get_json()["codServicio"]
        precio = request.get_json()["precio"]
        pesoI = request.get_json()["pesoI"]
        pesoF = request.get_json()["pesoF"]
        subtotal = request.get_json()["subtotal"]
        rango = request.get_json()["rango"]
        # print(fechaP, idCliente, idEmpleado, fechaE, usuario, codServicio, precio, pesoI, pesoF, subtotal, rango)
        insert = PedidoCliente.insert_Pedido(fechaP, idCliente, idEmpleado, fechaE, usuario, codServicio, precio, pesoI, pesoF, subtotal, rango)
        getPedidos = PedidoCliente.getPedidosPendienteCliente(idCliente)
        detallePedido = PedidoCliente.formatearDatos(getPedidos)
        return jsonify({"pedido": detallePedido})

@app.route("/pedidosclientespendientes/<codigo>")
def pedidosclientespendientes(codigo):
        if(codigo=="undefine"):
                getPedidos = PedidoCliente.getPedidosPendienteCliente(codigo)
        else:
                getPedidos = PedidoCliente.getPedidosPendiente()
        detallePedido = PedidoCliente.formatearDatos(getPedidos)
        return jsonify({"pedido": detallePedido})

@app.route("/pedidobyid/<codigo>")
def pedidobyid(codigo):
        print(codigo)
        getPedidos = PedidoCliente.getPedidosById(codigo)
        getDetalle = PedidoCliente.getDetallePedidosById(codigo)
        listaDetalle = PedidoCliente.formatearDetalle(getDetalle)
        detallePedido = PedidoCliente.formatearDatos(getPedidos)
        return jsonify({"pedido": detallePedido}, {"detalle": listaDetalle})

@app.route("/pedidosClientesConfirmados")
def pedidosClientesConfirmados():
        getPedidos = PedidoCliente.getPedidosConfirmados()
        detallePedido = PedidoCliente.formatearDatos(getPedidos)
        return jsonify({"pedido": detallePedido})

@app.route("/pedidosClientesConfirmadosById/<codigo>")
def pedidosClientesConfirmadosById(codigo):
        getPedidos = PedidoCliente.getPedidosConfirmadosById(codigo)
        detallePedido = PedidoCliente.formatearDatos(getPedidos)
        return jsonify({"pedido": detallePedido})

@app.route("/anularPedidosConfirmados", methods=["PUT"])
def anularPedidosConfirmados():
        codigo = request.get_json()["codigo"]
        usuario = request.get_json()["userLogueado"]
        PedidoCliente.AnularPedidosconfirmados(codigo, usuario)
        getPedidos = PedidoCliente.getPedidosConfirmados()
        detallePedido = PedidoCliente.formatearDatos(getPedidos)
        return jsonify({"pedido": detallePedido})

@app.route("/confirmarPedidos/<usuario>", methods=["POST"])
def confirmarPedidos(usuario):
        idCliente = None
        listaPedido = request.get_json()
        for c in listaPedido:
                codigo = c['codigoPedido']
                print(codigo, usuario)
                idCliente = c["codCliente"]
                PedidoCliente.confirmarPedido(codigo, usuario)
        getPedidos = PedidoCliente.getPedidosPendienteCliente(idCliente)
        detallePedido = PedidoCliente.formatearDatos(getPedidos)
        return jsonify({"pedido": detallePedido})

@app.route("/anularPedidosclientes", methods=["POST"])
def anularPedidos():
        usuario = request.get_json()["usuario"]
        idPedido = request.get_json()["idPedido"]
        PedidoCliente.anularPedido(idPedido, usuario)
        idCliente = request.get_json()["idCliente"]
        getPedidos = PedidoCliente.getPedidosPendienteCliente(idCliente)
        detallePedido = PedidoCliente.formatearDatos(getPedidos)
        return jsonify({"pedido": detallePedido})

@app.route("/addChofer", methods=["PUT"])
def addChofer():
        codChofer = request.get_json()["idEmpleado"]
        idPedido = request.get_json()["codPedido"]
        usuario = request.get_json()["usuario"]
        PedidoCliente.addChofer(idPedido, codChofer, usuario)
        return jsonify({"message": "El chofer se agrego correctamente"})

