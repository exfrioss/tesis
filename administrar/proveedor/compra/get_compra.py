from agente.Proveedor.get_proveedor import Proveedor
from administrar.proveedor.pedido.get_pedido import Pedido
from administrar.proveedor.insumo.get_insumo import Insumo
from administrar.proveedor.pedido.get_pedido import Pedido
from agente.Personal.query_personal import Personal
from app import db
import MySQLdb


class Compra:
    @staticmethod
    def getCompras():
        try:
            connect = db.connection.cursor()
            getCompras = "select * from compra where anulado = '0'"
            try:
                connect.execute(getCompras)
                datosCompras = connect.fetchall()
                return datosCompras
            except MySQLdb.Error as error:
                error_message = "Error al obtener registros: '"+str(error)+"'"
                return error_message
        except MySQLdb.Error as error:
            error_message = "Error al tratar de conectar: '"+str(error)+"'"
            return error_message
    @staticmethod
    def getComprasAnulados():
        try:
            connect = db.connection.cursor()
            getCompras = "select * from compra where anulado = '1'"
            try:
                connect.execute(getCompras)
                datosCompras = connect.fetchall()
                return datosCompras
            except MySQLdb.Error as error:
                error_message = "Error al obtener registros: '"+str(error)+"'"
                return error_message
        except MySQLdb.Error as error:
            error_message = "Error al tratar de conectar: '"+str(error)+"'"
            return error_message


    @staticmethod
    def getcomprasById(id):
        print(id)
        try: 
            connect = db.connection.cursor()
            getComprasById = "select * from compra where numero_factura = '"+str(id)+"'"
            try:
                connect.execute(getComprasById)
                datosCOmprasById = connect.fetchall()
                return datosCOmprasById
            except MySQLdb.Error as error:
                error_message = "Error al obtener registros: '"+str(error)+"'"
                return error_message
        except MySQLdb.Error as error:
            error_message = "Error al tratar de realizar la consulta (verificar base de datos): '"+str(
                error)+"'"
            return error_message

    @staticmethod
    def getComprasA(anulado):
        try:
            connect = db.connection.cursor()
            getComprasAnuladas = "select * from compra where anulado = '" + \
                str(anulado)+"'"
            try:
                connect.execute(getComprasAnuladas)
                datosComprasA = connect.fetchall()
            except MySQLdb.Error as error:
                error_message = "Error al obtener registros: '"+str(error)+"'"
                return error_message
        except MySQLdb.Error as error:
            error_message = "Error al tratar de establecer consulta (vericar BD): '"+str(
                error)+"'"
            return error_message

    @staticmethod
    def setJsonCompras(lisCompras):
        setcompras = None
        listCompras = []
        nombre = None
        apellido = None
        razonSocial = None
        totalPedido = None
        sFechaPedido = None
        nPersonal = None
        aPersonal = None
        aPersonalP = None
        # print(lisCompras)
        for compra in lisCompras:
            numeroFactura = compra[0]
            fecha = compra[1]
            fechaString = str(fecha)
            total = compra[2]
            idproveedor = compra[3]
            getproveedor = Proveedor.getProveedorById(idproveedor)
            for proveedor in getproveedor:
                razonSocial = proveedor[2]
                nombre = proveedor[8]
            pedido = compra[4]
            getPedido = Pedido.getPedidoByID(pedido)
            for p in getPedido:
                totalPedido = p[3]
                sFechaPedido = str(p[1])
                idPersonalP = p[7]
                getF = Personal.getPersonalById(idPersonalP)
                for z in getF:
                    aPersonalP = z[3]                 
            anulado = compra[5]
            funcionario = compra[6]
            getFuncionario = Personal.getPersonalById(funcionario)
            for f in getFuncionario:
                nPersonal = f[2]
                aPersonal = f[3]
            setCompras = {
                'codigo': numeroFactura,
                'fechaString': fechaString,
                'fecha': fecha,
                'total': total,
                'idproveedor': idproveedor,
                'idpedido': pedido,
                'anulado': anulado,
                'idfuncionario': funcionario,
                'contactoProvedor': nombre,
                'razonSocial': razonSocial,
                'totalPedido': totalPedido,
                'sFechaPedido': sFechaPedido,
                'nPersonal': nPersonal,
                'aPersonal': aPersonal,
                'aPersonalP': aPersonalP
            }
            listCompras.append(setCompras)
        return listCompras

    @staticmethod 
    def insertCompra(numeroFactura, fecha, total, idproveedor, idpedido, idempleado, detalle):
        try:
            connect = db.connection.cursor()
            sql_actionInsertC = "insert into compra(numero_factura, fecha, total_pago, proveedor_codproveedor, pedido_cod_pedido, empleado_cod_empleado) values('"+str(numeroFactura)+"', '"+str(fecha)+"', '"+str(total)+"', '"+str(idproveedor)+"', '"+str(idpedido)+"', '"+str(idempleado)+"')"
            connect.execute(sql_actionInsertC)
            for d in detalle:
                cantidad = d['cantidad']
                ssss = d['cantidad']
                codigo = d['codigo']
                subtotal = d['subtotal']
                precio = d['precio']
                iva10 = d['iva10']
                iva5 = d['iva5']
                sql_actionInsertD = "insert into detalle_compra(compra_numero_factura, insumo_cod_insumo, cantidad, precio_unitario, iva5, iva10, subtotal) value('"+str(numeroFactura)+"', '"+str(codigo)+"','"+str(cantidad)+"','"+str(precio)+"','"+str(iva5)+"','"+str(iva10)+"','"+str(subtotal)+"')"
                connect.execute(sql_actionInsertD)
                sql_actionUpdatePedido = "update detalle_pedido set cantidad_comprada = '"+str(cantidad)+"' where insumo_cod_insumo = '"+codigo+"' and pedido_cod_pedido = '"+str(idpedido)+"'"
                connect.execute(sql_actionUpdatePedido)
                getInsumo = Insumo.getInsumoById(codigo)
                for ins in getInsumo:
                    stockA = ins[5]
                    print(stockA, cantidad)
                    totalStock = float(stockA) + float(cantidad)
                    print(totalStock)
                    sql_actionUpdateInsumo = "update insumo set stock_actual = '"+str(totalStock)+"' where cod_insumo = '"+str(codigo)+"'" 
                    connect.execute(sql_actionUpdateInsumo)
                getDetallePedido = Pedido.getDetallePedidoByID(idpedido)
                if len(detalle) == len(getDetallePedido):
                    updateEstadoPedido = "update pedido set estado = '1' where cod_pedido='"+str(idpedido)+"'"
                    connect.execute(updateEstadoPedido)
                # for det in getDetallePedido:
                #     cantidadInsumo = det[2]
                #     cantidaComprada = det[5]
                #     if cantidad == cantidadInsumo:
                        
                #     else:
                #         updateEstadoPedido = "update pedido set estado = '0' where cod_pedido='"+str(idpedido)+"'"
                
            connect.connection.commit()
            success = "GOOD JOB, We are alive"
            return success
        except MySQLdb.Error as error:
            connect.connection.rollback()
            error_message = "ERROR: Mission aborted '("+str(error)+")'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def anularCompra(idCompra):
        idPedido = None
        cantidadComprada = None
        try:
            connect = db.connection.cursor()
            anular = "update compra set anulado = '1' where numero_factura = '"+str(idCompra)+"'"
            connect.execute(anular)

            getCompra = Compra.getcomprasById(idCompra)
            for c in getCompra:
                idPedido = c[4]
            activarPedido = "update pedido set estado = '0' where cod_pedido='"+str(idPedido)+"'"
            connect.execute(activarPedido)

            getDetallePedido = Pedido.getDetallePedidoByID(idPedido)
            for d in getDetallePedido:
                cantidadComprada = d[5]
                idInsumo = d[0]
                restoreCantidadComprada = "update detalle_pedido set cantidad_comprada='0' where pedido_cod_pedido = '"+str(idPedido)+"'"
                connect.execute(restoreCantidadComprada)
                getInsumo = Insumo.getInsumoById(idInsumo)
                for i in getInsumo:
                    stock_actual = i[5]
                    newStock = float(stock_actual) - float(cantidadComprada)
                    restoreStock = "update insumo set stock_actual = '"+str(newStock)+"' where cod_insumo = '"+str(idInsumo)+"'"
                    connect.execute(restoreStock)
            connect.connection.commit()
            success = "Good job wey"
            print(success)
            return success
        except MySQLdb.Error as error:
            connect.connection.rollback()
            print(error)
            return error

    @staticmethod
    def filtrarCompra(fechaDesde, fechaHasta):
        connect = db.connection.cursor()
        getCompra = "select * from compra where fecha between '"+str(fechaDesde)+"' and '"+str(fechaHasta)+"'"
        connect.execute(getCompra)
        getData = connect.fetchall()
        return getData