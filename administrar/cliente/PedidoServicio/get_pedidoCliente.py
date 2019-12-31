from app import db
import MySQLdb
from agente.Personal.query_personal import Personal
from agente.Cliente.query_cliente import Cliente
from administrar.servicio.get_servicio import Servicio

class PedidoCliente:
    @staticmethod
    def getPedidosPendiente():
        try:
            connect  = db.connection.cursor()
            getPedidos = "select * from orden_servicio where estado='1' and anulado='0' and esConfirmado = '0' and isfacturado='0'"
            connect.execute(getPedidos)
            getData = connect.fetchall()
            print(getData)
            return getData
        except MySQLdb.Error as error:
            print(error)
            return error

    @staticmethod
    def getPedidosConfirmados():
        try:
            connect  = db.connection.cursor()
            getPedidos = "select * from orden_servicio where estado='1' and anulado='0' and esConfirmado = '1' and isfacturado='0'"
            connect.execute(getPedidos)
            getData = connect.fetchall()
            print(getData)
            return getData
        except MySQLdb.Error as error:
            print(error)
            return error

    @staticmethod
    def getPedidosConfirmadosById(codigo):
        try:
            connect  = db.connection.cursor()
            getPedidos = "select * from orden_servicio where cliente_ci_numero='"+str(codigo)+"' and estado='1' and anulado='0' and esConfirmado = '1' and isfacturado='0'"
            connect.execute(getPedidos)
            getData = connect.fetchall()
            print(getData)
            return getData
        except MySQLdb.Error as error:
            print(error)
            return error

    @staticmethod
    def getPedidosById(codigo):
        try:
            connect  = db.connection.cursor()
            getPedidos = "select * from orden_servicio where cod_pedidos='"+str(codigo)+"'"
            connect.execute(getPedidos)
            getData = connect.fetchall()
            print(getData)
            return getData
        except MySQLdb.Error as error:
            print(error)
            return error

    @staticmethod
    def getDetallePedidosById(codigo):
        try:
            connect  = db.connection.cursor()
            getPedidos = "select * from detalle_pedido_servicio where pedidosClientes_cod_pedidos='"+str(codigo)+"'"
            connect.execute(getPedidos)
            getData = connect.fetchall()
            print(getData)
            return getData
        except MySQLdb.Error as error:
            print(error)
            return error

    @staticmethod
    def getPedidosPendienteCliente(codigo):
        try:
            connect  = db.connection.cursor()
            getPedidos = "select * from orden_servicio where estado='1' and anulado='0' and esConfirmado = '0' and cliente_ci_numero='"+str(codigo)+"' and isfacturado='0'"
            connect.execute(getPedidos)
            getData = connect.fetchall()
            print(getData)
            return getData
        except MySQLdb.Error as error:
            print(error)
            return error


    @staticmethod
    def getDetallePedidosClientePendiente(codigo):
        try:
            connect  = db.connection.cursor()
            getPedidos = "select * from detalle_pedido_servicio where pedidosClientes_cod_pedidos='"+str(codigo)+"' and isfacturado='0'"
            connect.execute(getPedidos)
            getData = connect.fetchall()
            print(getData)
            return getData
        except MySQLdb.Error as error:
            print(error)
            return error

    @staticmethod
    def confirmarPedido(codigo, usuario):
        try:
            connect = db.connection.cursor()
            query = "update orden_servicio set esconfirmado='1', usuario='"+str(usuario)+"' where cod_pedidos='"+str(codigo)+"'"
            connect.execute(query)
            connect.connection.commit()
            ok = "good job"
            print(ok)
        except MySQLdb.Error as error:
            print(error)
        finally:
            connect.close()

    @staticmethod
    def AnularPedidosconfirmados(codigo, usuario):
        try:
            connect = db.connection.cursor()
            query = "update orden_servicio set esconfirmado='0', usuario='"+str(usuario)+"' where cod_pedidos='"+str(codigo)+"'"
            connect.execute(query)
            connect.connection.commit()
            ok = "good job"
            print(ok)
        except MySQLdb.Error as error:
            print(error)
        finally:
            connect.close()

    @staticmethod
    def insert_Pedido(fechaP, idCliente, idEmpleado, fechaE, usuario, codServicio, precio, pesoI, pesoF, subtotal, rango):
        idPedido = None
        try:
            connect = db.connection.cursor()
            insertCabecera = "insert into orden_servicio (fecha_pedidos, estado, cliente_ci_numero, empleado_cod_empleado, fecha_entrega, usuario, total) values('"+str(fechaP)+"', '1', '"+str(idCliente)+"', '"+str(idEmpleado)+"','"+str(fechaE)+"', '"+str(usuario)+"', '"+str(subtotal)+"')"
            connect.execute(insertCabecera)
            try:
                # pedido = "select cod_pedidos from orden_servicio order by cod_pedidos desc limit 1"
                connect2 = db.connection.cursor()
                getidPedido = "select @@identity AS cod_pedidos"
                connect2.execute(getidPedido)
                lidPedido = connect2.fetchall()
                connect2.close()
                for i in lidPedido:
                    idPedido = i[0]
                # print(idPedido)
                try:
                    insertDetalle = "insert into detalle_pedido_servicio(pedidosClientes_cod_pedidos, servicio_cod_servicio, cantidad, precio_unitario, peso_inicial, peso_fin, subtotal, diferencia_peso) values('"+str(idPedido)+"', '"+str(codServicio)+"', '1', '"+str(precio)+"', '"+str(pesoI)+"', '"+str(pesoF)+"', '"+str(subtotal)+"', '"+str(rango)+"')"
                    connect.execute(insertDetalle)
                    connect.connection.commit()
                    ok = "Good Job"
                    print(ok)
                    return ok
                except MySQLdb.Error as error:
                    print(error)
                    connect.connection.rollback()
            except MySQLdb.Error as error:
                print(error)
                connect.connection.rollback()
        except MySQLdb.Error as error:
            print(error)
            connect.connection.rollback()
            return error

    @staticmethod
    def anularPedido(idPedido, usuario):
        print(idPedido, usuario)
        try:
            connect = db.connection.cursor()
            sql = "update orden_servicio set anulado = '1', usuario='"+str(usuario)+"' where cod_pedidos='"+str(idPedido)+"'"
            connect.execute(sql)
            connect.connection.commit()
        except MySQLdb.Error as error:
            print("Error: ",error)
            return error

    @staticmethod
    def addChofer(idPedido, codChofer, usuario):
        print(idPedido, codChofer, usuario)
        try:
            connect = db.connection.cursor()
            sql = "update orden_servicio set chofer_id_chofer = '"+str(codChofer)+"', usuario='"+str(usuario)+"' where cod_pedidos='"+str(idPedido)+"'"
            connect.execute(sql)
            connect.connection.commit()
        except MySQLdb.Error as error:
            print("Error: ",error)
            return error

    @staticmethod
    def formatearDatos(lista):
        servicio = None
        ruc = None
        pedido = None
        cliente = None
        personal = None
        detallePedido = []
        for p in lista:
                getPersonal = Personal.getPersonalById(p[6])
                for per in getPersonal:
                    personal = str(per[2]+" "+per[3])
                getDetalle = PedidoCliente.getDetallePedidosClientePendiente(p[0])
                getCliente = Cliente.get_cliente_For_ID(p[4])
                for c in getCliente:
                        cliente = str(c[1]+" "+c[2])
                        ruc = str(c[0]+"-"+c[6])
                for d in getDetalle:
                     getServicio = Servicio.get_servicioByID(d[1])
                     for s in getServicio:
                             servicio = s[1] 
                pedido = {
                        'fechaEntrega': str(p[8]),
                        'descripcion': servicio,
                        'cliente': cliente,
                        "codigoPedido": p[0],
                        'ruc': ruc,
                        "codCliente": p[4],
                        "chofer": p[6],
                        "personal": personal
                }
                detallePedido.append(pedido)
        return detallePedido

    @staticmethod
    def formatearDetalle(lista):
        servicio = None
        iva=0
        iva5=0
        iva10=0
        precio_kilos=None
        precioIva5=0
        precioIva10=0
        exentas = 0
        listaDetalle = []
        datos = None
        for d in lista:
            cod_Pedido = d[0]
            cod_servicio = d[1]
            cantidad = d[2]
            precio_unitario_servicio = d[3]
            peso_inicial = d[4]
            peso_final = d[5]
            subtotal = d[6]
            tolerancia = d[8]
            getServicio = Servicio.get_servicioByID(cod_servicio)
            for s in getServicio:
                servicio = s[1]
                iva = s[3]
                # precio_kilos = s[2]
                if s[3]==5:
                    iva5 = float(subtotal)/float(21)
                    precioIva5 = d[6]
                if s[3]==10:
                    iva10 = float(subtotal)/float(11)
                    precioIva10 = d[6]
                if s[3]==0:
                    exentas = d[6]

                datos = {
                    'cod_Pedido': cod_Pedido,
                    'cod_servicio': cod_servicio,
                    'cantidad': cantidad,
                    'precio_unitario_servicio': precio_unitario_servicio,
                    'peso_inicial': peso_inicial,
                    'peso_final': peso_final,
                    'subtotal': subtotal,
                    'tolerancia': tolerancia,
                    'precio_kilos': precio_kilos,
                    'servicio':servicio,
                    'iva': iva,
                    'iva5': iva5,
                    'iva10': iva10,
                    'precioIva10': precioIva10,
                    'precioIva5': precioIva5,
                    'exentas': exentas
                }
            listaDetalle.append(datos)
        return listaDetalle
            