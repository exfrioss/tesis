from app import db
import MySQLdb
from agente.Proveedor.get_proveedor import Proveedor
from agente.Personal.query_personal import Personal
from administrar.proveedor.insumo.get_insumo import Insumo

 
class Pedido:
    @staticmethod
    def getPedidos():
        try:
            connect = db.connection.cursor()
            getDatos = "select * from pedido where anulado = '0' and estado = '0'"
            try:
                connect.execute(getDatos)
                datosPedidos = connect.fetchall()
                return datosPedidos
            except MySQLdb.Error as error:
                message_error = "Mysql Eror: '"+str(error)+"'"
                return message_error
        except MySQLdb.Error as error:
            message_error = "Mysql Error: '"+str(error)+"'"
            return message_error
        finally:
            connect.close()

    @staticmethod
    def getDetallePedidos(idPedido):
        try:
            connect = db.connection.cursor()
            getDatos = "select * from detalle_pedido where pedido_cod_pedido = '" + \
                str(idPedido)+"' and cantidad!=cantidad_comprada"
            try:
                connect.execute(getDatos)
                detallePedidos = connect.fetchall()
                return detallePedidos
            except MySQLdb.Error as error:
                message_error = "Mysql Eror: '"+str(error)+"'"
                return message_error
        except MySQLdb.Error as error:
            message_error = "Mysql Error: '"+str(error)+"'"
            return message_error
        finally:
            connect.close()

    @staticmethod
    def insertPedido(fechaP, total, proveedor, empleado, usuario):
        try:
            connect = db.connection.cursor()
            queryInsert = "INSERT INTO pedido (fecha_pedido, total_pago, anulado, estado, proveedor_codproveedor, empleado_cod_empleado, usuario) VALUES ('"+str(
                fechaP)+"', '"+str(total)+"', '0', '0', '"+str(proveedor)+"', '"+str(empleado)+"', '"+str(usuario)+"')"
            try:
                connect.execute(queryInsert)
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+str(error)+"'"
            try:
                connect.connection.commit()
                success_message = "Registro há sido insertado correctamente"
                return success_message
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+error+"'"
        except MySQLdb.Error as error:
            error_messge = "Mysql Error: '"+str(error)+"'"
        finally:
            connect.close()

    @staticmethod
    def insertDetallePedido(idinsumo, codigo, cantidad, precio, subtotal):
        try:
            connect = db.connection.cursor()
            queryInsert = "INSERT INTO detalle_pedido (insumo_cod_insumo, pedido_cod_pedido, cantidad, precio_unitario, subtotal) VALUES ('"+str(
                idinsumo)+"', '"+str(codigo)+"', '"+str(cantidad)+"', '"+str(precio)+"', '"+str(subtotal)+"')"
            try:
                connect.execute(queryInsert)
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+str(error)+"'"
            try:
                connect.connection.commit()
                success_message = "Registro há sido insertado correctamente"
                return success_message
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+error+"'"
        except MySQLdb.Error as error:
            error_messge = "Mysql Error: '"+str(error)+"'"
        finally:
            connect.close()

    @staticmethod
    def getLastPedidos():
            try:
                connect = db.connection.cursor()
                getDatos = "select * from pedido order by cod_pedido desc limit 1"
                try:
                    connect.execute(getDatos)
                    datosPedidos = connect.fetchall()
                    return datosPedidos
                except MySQLdb.Error as error:
                    message_error = "Mysql Eror: '"+str(error)+"'"
                    return message_error
            except MySQLdb.Error as error:
                message_error = "Mysql Error: '"+str(error)+"'"
                return message_error
            finally:
                connect.close()

    @staticmethod
    def getPedidoByID(cod):
        try:
            connect = db.connection.cursor()
            getDatos = "select * from pedido where cod_pedido= '"+str(cod)+"'"
            try:
                connect.execute(getDatos)
                datosPedidos = connect.fetchall()
                return datosPedidos
            except MySQLdb.Error as error:
                message_error = "Mysql Eror: '"+str(error)+"'"
                return message_error
        except MySQLdb.Error as error:
            message_error = "Mysql Error: '"+str(error)+"'"
            return message_error
        finally:
            connect.close()

    @staticmethod
    def getDetallePedidoByID(cod):
        try:
            connect = db.connection.cursor()
            getDatos = "select * from detalle_pedido where pedido_cod_pedido= '"+str(cod)+"'"
            try:
                connect.execute(getDatos)
                datosPedidos = connect.fetchall()
                return datosPedidos
            except MySQLdb.Error as error:
                message_error = "Mysql Eror: '"+str(error)+"'"
                return message_error
        except MySQLdb.Error as error:
            message_error = "Mysql Error: '"+str(error)+"'"
            return message_error
        finally:
            connect.close()

    @staticmethod
    def anularPedidos(idPedido, usuario):
        print(idPedido, usuario)
        try:
            connect = db.connection.cursor()
            getCompras = "select * from compra where pedido_cod_pedido = '"+str(idPedido)+"' and anulado = '0'"
            connect.execute(getCompras)
            compras = connect.fetchall()
            print(compras)
            if compras != ():
               menssage = "Éste pedido ya há sido aprobado"
               print(menssage)
               return menssage
            else:
                updatepedido = "update pedido set anulado = '1', usuario='"+str(usuario)+"' where cod_pedido = '"+str(idPedido)+"'"
                connect.execute(updatepedido)
                connect.connection.commit()
                getPedidoActualizado = "select * from pedido"
                connect.execute(getPedidoActualizado)
                datosActualizados = connect.fetchall()
                menssage = "Pedido há sido anulado correctamente"
                return datosActualizados
        except MySQLdb.Error as error:
            menssage = "Error mysql: '"+str(error)+"'"
            return menssage

    @staticmethod
    def getPedidosAnulados():
        try:
            connect = db.connection.cursor()
            getDatos = "select * from pedido where anulado = '1'"
            try:
                connect.execute(getDatos)
                datosPedidos = connect.fetchall()
                return datosPedidos
            except MySQLdb.Error as error:
                message_error = "Mysql Eror: '"+str(error)+"'"
                return message_error
        except MySQLdb.Error as error:
            message_error = "Mysql Error: '"+str(error)+"'"
            return message_error
        finally:
            connect.close()

    @staticmethod
    def getPedidosComprados():
        try:
            connect = db.connection.cursor()
            getDatos = "select * from pedido where estado = '1' and anulado = '0'"
            try:
                connect.execute(getDatos)
                datosPedidos = connect.fetchall()
                return datosPedidos
            except MySQLdb.Error as error:
                message_error = "Mysql Eror: '"+str(error)+"'"
                return message_error
        except MySQLdb.Error as error:
            message_error = "Mysql Error: '"+str(error)+"'"
            return message_error
        finally:
            connect.close()


    @staticmethod
    def datosFormateados(lista):
            listaPedidos = []
            personalN = None
            personalA = None
            proveedor = None
            pedido = None
            iDescripcion = None
            detalle = None
            fecha = ""
            detallePedido = []
        # try:
            for p in lista:
                codigo = p[0]
                getDetallePedido = Pedido.getDetallePedidos(codigo)
                for de in getDetallePedido:
                    idinsumo = de[0]
                    getdescripcion = Insumo.getInsumoById(idinsumo)
                    for i in getdescripcion:
                        iDescripcion = i[1]
                    idpedido = de[1]
                    cantidad = de[2]
                    precioUnitario = de[3]
                    subTotal = de[4]
                    cantidadComprada = de[5]
                    detalle = {
                        'idinsumo' : idinsumo,
                        'idpedido' :idpedido,
                        'cantidad' : cantidad,
                        'precioUnitario' : precioUnitario,
                        'subTotal' : subTotal,
                        'cantidadComprada' : cantidadComprada,
                        'descripcion': iDescripcion
                    }
                    detallePedido.append(detalle)
                fechaP = p[1]
                fecha = str(fechaP)
                total = p[3]
                anulado = p[4]
                estado = p[5]
                idproveedor = p[6]
                getProveedor =Proveedor.getProveedorById(idproveedor)
                for pro in getProveedor:
                    proveedor = pro[2]
                idempleado = p[7]
                getPersonal = Personal.getPersonalById(idempleado)
                for per in getPersonal:
                    personalN = per[2]
                    personalA = per[3]
                pedido = {
                    'codigo': codigo,
                    'fechaP': fecha,
                    'total': total,
                    'anulado': anulado,
                    'estado': estado,
                    'idproveedor': idproveedor,
                    'idempleado': idempleado,
                    'proveedor':proveedor,
                    'personalN': personalN,
                    'personalA': personalA,
                    'detallePedido': detallePedido
                }
                listaPedidos.append(pedido)
            return listaPedidos    
        # except:
        #     error_message = "Ha pcurrido un error"
        #     return error_message