from flask import Flask, jsonify, request
from administrar.proveedor.pedido.get_pedido import Pedido
from agente.Proveedor.get_proveedor import Proveedor
from agente.Personal.query_personal import Personal
from administrar.proveedor.insumo.get_insumo import Insumo
from agente.Personal.query_personal import Personal
from app import app, db


@app.route("/pedido")
def getPedido():
    getDatosPedidos = Pedido.getPedidos()
    getDatosFormateados = Pedido.datosFormateados(getDatosPedidos)
    return jsonify({"pedido": getDatosFormateados})


@app.route("/addpedidos", methods=["POST"])
def addpedidos():
    if request.method == 'POST':
        idEmpleado = None
        fechaP = request.get_json()['fechaP']
        total = request.get_json()['total']
        proveedor = request.get_json()['idproveedor']
        empleado = request.get_json()['idempleado']
        usuario = request.get_json()['usuario']
        getEmpleado = Personal.getPersonalByEmail(empleado)
        for e in getEmpleado:
            idEmpleado = e[0]
        addPedidosProveedor = Pedido.insertPedido(
            fechaP, total, proveedor, idEmpleado, usuario)
        getDatosPedidos = Pedido.getPedidos()
        getDatosFormateados = Pedido.datosFormateados(getDatosPedidos)
        return jsonify({"pedido": getDatosFormateados})


@app.route("/addetallepedidos", methods=["POST"])
def addetallepedidos():
    iva5 = None
    iva10 = None
    if request.method == 'POST':
        cantidad = request.get_json()['cantidad']
        producto = request.get_json()['codigo']
        precio = request.get_json()['precio']
        subtotal = request.get_json()['subtotal']
        codigo = None
        lastPedido = Pedido.getLastPedidos()
        # codigoP = None
        for value in lastPedido:
            id = value[0]
            codigo = id
        addDetallePedidosProveedor = Pedido.insertDetallePedido(
            producto, codigo, cantidad, precio, subtotal)
        print("La sentencia há sido: "+addDetallePedidosProveedor)
        getDatosPedidos = Pedido.getPedidos()
        getDatosFormateados = Pedido.datosFormateados(getDatosPedidos)
        return jsonify({"pedido": getDatosFormateados})


@app.route("/lastid")
def lastid():
    lastPedido = Pedido.getLastPedidos()
    cod_pedido = []
    codigo = None
    for value in lastPedido:
        id = value[0]
        codigo = {
            'codigo': id,
        }
        cod_pedido.append(codigo)
    return jsonify({'codigo': cod_pedido})


@app.route("/getPedidoByid/<id>")
def getPedidoByid(id):
    getDatosPedidos = Pedido.getPedidoByID(id)
    getDatosFormateados = Pedido.datosFormateados(getDatosPedidos)
    return jsonify({"pedido": getDatosFormateados})


@app.route("/anularPedido", methods=["PUT"])
def anularPedido():
    idPedido = request.get_json()["codigo"]
    usuario = request.get_json()["usuario"]
    anular = Pedido.anularPedidos(idPedido, usuario)
    listPedidos = Pedido.getPedidos()
    if anular:
        getDatosFormateados = Pedido.datosFormateados(listPedidos)
        return jsonify({"pedido": getDatosFormateados})
    else:
        error = "error en la consulta"
        return jsonify(error)


@app.route("/pedidosAnulados")
def getPedidosAnulados():
    getDatosPedidos = Pedido.getPedidosAnulados()
    getDatosFormateados = Pedido.datosFormateados(getDatosPedidos)
    return jsonify({"pedido": getDatosFormateados})
        


@app.route("/pedidosComprados")
def getPedidosComprados():
    getDatosPedidos = Pedido.getPedidosComprados()
    getDatosFormateados = Pedido.datosFormateados(getDatosPedidos)
    return jsonify({"pedido": getDatosFormateados})