from flask import Flask, jsonify, request
from app import app, db
from administrarbd.get_actividades import Graficos
from agente.Proveedor.get_proveedor import Proveedor
from administrar.proveedor.insumo.get_insumo import Insumo

@app.route("/actividades/<usuario>")
def actividades(usuario):
    listLabel = []
    listFila = []
    listTablas = []
    mascara = None
    day = 1
    getActivity = Graficos.get_userActivity(day, usuario)
    for a in getActivity:
        listFila.append(a[2])
        mascara = {
            "estiqueta": str(a[1]+" ("+a[0]+")")
        }
        print(mascara)
        listLabel.append(mascara)
    return jsonify({"rows":listFila}, {"labels": listLabel})

@app.route("/actividadesPedidos")
def actividadesPedidos():
    proveedor = None
    label = None
    row = None
    labels = []
    rows = []
    getActivity = Graficos.getPedidos_Activity()
    for p in getActivity:
        date = str(p[1])
        proveedor = Proveedor.getProveedorById(p[0])
        for pro in proveedor:
            proveedor = pro[2]
        label = {
            "label": str( proveedor+" ("+date+")")
        }
        print(label)
        labels.append(label)
        rows.append(p[2])
    return jsonify({"rows": rows}, {"labels": labels})

@app.route("/productosActivity")
def productosActivity():
    labels = []
    rows = []
    getProductosActivity = Graficos.getPedidos_Productos_Activity()
    for producto in getProductosActivity:
        getProductosPedidos = Insumo.getInsumoById(producto[0])
        for i in getProductosPedidos:
            descripcion = i[1]
        labels.append(descripcion)
        rows.append(producto[1])
    return jsonify({"rows": rows}, {"labels": labels})

@app.route("/clienteActivity", methods=["POST"])
def clienteActivity():
    anulado = None
    esconfirmado = None
    codigoCliente = request.get_json()["codigoCliente"]
    anuladoB = request.get_json()["anulado"]
    esconfirmadoB = request.get_json()["esconfirmado"]
    fechaD = request.get_json()["fechaD"]
    fechaH = request.get_json()["fechaH"]
    if anuladoB:
        anulado = '1'
    else:
        anulado = '0'
    if esconfirmadoB:
        esconfirmado = '1'
    else:
        esconfirmado = '0'
    getDatos = Graficos.clienteActivity(codigoCliente, anulado, esconfirmado, fechaD, fechaH)
    lista = Graficos.formateraDatosClienteActivity(getDatos)
    return jsonify({"activity": lista})


@app.route("/clienteActivityAnulados", methods=["POST"])
def clienteActivityAnulados():
    anulado = None
    esconfirmado = None
    codigoCliente = request.get_json()["codigoCliente"]
    anuladoB = request.get_json()["anulado"]
    esconfirmadoB = request.get_json()["esconfirmado"]
    fechaD = request.get_json()["fechaD"]
    fechaH = request.get_json()["fechaH"]
    if anuladoB:
        anulado = '1'
    else:
        anulado = '0'
    if esconfirmadoB:
        esconfirmado = '1'
    else:
        esconfirmado = '0'
    getDatos = Graficos.clienteActivityAnulado(codigoCliente, anulado, esconfirmado, fechaD, fechaH)
    lista = Graficos.formateraDatosClienteActivity(getDatos)
    return jsonify({"activity": lista})

@app.route("/userActivity", methods=["POST"])
def userActivity():
    dato = None
    datos = []
    # evento = request.get_json()["evento"]
    usuario = request.get_json()["usuario"]
    fechaD = request.get_json()["fechaD"]
    fechaH = request.get_json()["fechaH"]
    getData = Graficos.userActivity(usuario, fechaD, fechaH)
    for u in getData:
        print(u)
        idAuditoria = u[0]
        oldUser = u[1]
        usuario = u[2]
        fecha = str(u[3])
        evento = u[4]
        usuarioBd = u[5]
        tabla = u[6]
        dato = {
            'idAuditoria': idAuditoria,
            'oldUser': oldUser,
            'usuario': usuario,
            'fecha': fecha,
            'evento': evento,
            'usuarioBd': usuarioBd,
            'tabla': tabla
        }
        datos.append(dato)
    return jsonify({"userActivity": datos})

    