from flask import Flask, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

app = Flask(__name__)
app.config.from_pyfile('mysql_connect.py')
db = MySQL(app)

CORS(app, resources={r'/*':{'origins':'*'}})

from localidades.region.region import *
from localidades.departamento.departamento import *
from localidades.ciudad.ciudad import *
from agente.Cliente.cliente import *
from agente.Personal.personal import *
from agente.Proveedor.proveedor import *
from agente.cargo.cargo import *
from administrar.proveedor.insumo.insumo import *
from administrar.proveedor.pedido.pedido import *
from administrar.proveedor.compra.compra import *
from administrar.vehiculo.marca.marca import *
from administrar.vehiculo.modelo.modelo import *
from administrar.vehiculo.seguro.seguro import *
from administrar.vehiculo.tipo.tipo_vehiculo import *
from administrar.vehiculo.vehiculo.vehiculo import *
from administrar.servicio.servicio import *
from administrar.acceso.control import *
from administrarbd.actividad import *
from administrar.cliente.PedidoServicio.pedidoCliente import *
from factura.ajusteFactura.talonario import *
from administrar.cliente.Factura.factura import *

# from cliente.Cliente import *

if __name__ == "__main__":
    app.run(port=3030, debug=True)