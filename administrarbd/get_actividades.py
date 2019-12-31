from app import db
import MySQLdb

class Graficos:
    @staticmethod
    def get_userActivity(day, usuario):
        try:
            connect = db.connection.cursor()
            query = "select tabla, evento, count(*) from auditoria where fecha between now() - interval '"+str(day)+"' day and now() and usuario = '"+str(usuario)+"' group by tabla, evento"
            connect.execute(query)
            getActivity = connect.fetchall()
            # print(getActivity)
            return getActivity
        except MySQLdb.Error as error:
            print(error)
            return error
        finally:
            connect.close()


    @staticmethod
    def userActivity(usuario, fechaD, fechaH):
        print(usuario, fechaD, fechaH)
        try:
            connect = db.connection.cursor()
            query = "select * from auditoria where fecha between '"+str(fechaD)+"' and '"+str(fechaH)+"' and usuario='"+usuario+"' "
            connect.execute(query)
            getData = connect.fetchall()
            print("good job")
            return getData
        except MySQLdb.Error as error:
            print(error)


    @staticmethod
    def getPedidos_Activity():
        try:
            connect = db.connection.cursor()
            query = "select proveedor_codproveedor, fecha_pedido, count(*) from pedido where fecha_pedido BETWEEN NOW() - INTERVAL '30' DAY AND NOW() and anulado = '1' group by proveedor_codproveedor, fecha_pedido"
            connect.execute(query)
            activityPedido = connect.fetchall()
            return activityPedido
        except MySQLdb.Error as eeror:
            print(error)
            return error
        finally:
            connect.close()

    @staticmethod
    def getPedidos_Productos_Activity():
        try:
            connect = db.connection.cursor()
            query = "select insumo_cod_insumo, sum(cantidad) from detalle_pedido where NOW() BETWEEN NOW() - INTERVAL '30' DAY AND NOW() group by insumo_cod_insumo"
            connect.execute(query)
            getActivity = connect.fetchall()
            return getActivity
        except MySQLdb.Error as error:
            print(error)
            return error
        finally:
            connect.close()


    @staticmethod
    def clienteActivity(codigoCliente, anulado, esconfirmado, fechaD, fechaH):
        print(codigoCliente, anulado, esconfirmado, fechaD, fechaH)
        connect = db.connection.cursor()
        query = "select orden_servicio.fecha_pedidos, servicio.idciudadOrigen, servicio.lugarCarga, orden_servicio.fecha_entrega, servicio.idCiudadDestino, servicio.lugarDestino, servicio.descripcion, vehiculo.cod_vehiculo, insumo.descripcion, sum(detalle_insumo_servicio.cantidad), sum(detalle_insumo_servicio.total), sum(detalle_pedido_servicio.subtotal), ((sum(detalle_pedido_servicio.subtotal))-(sum(detalle_insumo_servicio.total))) from orden_servicio inner join cliente on orden_servicio.cliente_ci_numero = cliente.ci_numero left join factura_cliente on factura_cliente.cliente_ci_numero = cliente.ci_numero inner join detalle_pedido_servicio on detalle_pedido_servicio.pedidosClientes_cod_pedidos = orden_servicio.cod_pedidos inner join servicio on servicio.cod_servicio = detalle_pedido_servicio.servicio_cod_servicio inner join vehiculo on vehiculo.cod_vehiculo = servicio.vehiculo_cod_vehiculo inner join detalle_insumo_servicio on detalle_insumo_servicio.servicio_cod_servicio = servicio.cod_servicio inner join insumo on insumo.cod_insumo = detalle_insumo_servicio.insumo_cod_insumo and cliente.ci_numero = '"+str(codigoCliente)+"' and orden_servicio.esConfirmado='"+esconfirmado+"' and orden_servicio.fecha_pedidos between '"+str(fechaD)+"' and '"+str(fechaH)+"' group by orden_servicio.fecha_pedidos, servicio.idciudadOrigen, servicio.lugarCarga,orden_servicio.fecha_entrega, servicio.idCiudadDestino, servicio.lugarDestino, servicio.descripcion, vehiculo.cod_vehiculo, insumo.descripcion"
        connect.execute(query)
        datos = connect.fetchall()
        return datos

    @staticmethod
    def clienteActivityAnulado(codigoCliente, anulado, esconfirmado, fechaD, fechaH):
        print(codigoCliente, anulado, esconfirmado, fechaD, fechaH)
        connect = db.connection.cursor()
        query = "select orden_servicio.fecha_pedidos, servicio.idciudadOrigen, servicio.lugarCarga, orden_servicio.fecha_entrega, servicio.idCiudadDestino, servicio.lugarDestino, servicio.descripcion, vehiculo.cod_vehiculo, insumo.descripcion, sum(detalle_insumo_servicio.cantidad), sum(detalle_insumo_servicio.total), sum(detalle_pedido_servicio.subtotal), ((sum(detalle_pedido_servicio.subtotal))-(sum(detalle_insumo_servicio.total))) from orden_servicio inner join cliente on orden_servicio.cliente_ci_numero = cliente.ci_numero left join factura_cliente on factura_cliente.cliente_ci_numero = cliente.ci_numero inner join detalle_pedido_servicio on detalle_pedido_servicio.pedidosClientes_cod_pedidos = orden_servicio.cod_pedidos inner join servicio on servicio.cod_servicio = detalle_pedido_servicio.servicio_cod_servicio inner join vehiculo on vehiculo.cod_vehiculo = servicio.vehiculo_cod_vehiculo inner join detalle_insumo_servicio on detalle_insumo_servicio.servicio_cod_servicio = servicio.cod_servicio inner join insumo on insumo.cod_insumo = detalle_insumo_servicio.insumo_cod_insumo and cliente.ci_numero = '"+str(codigoCliente)+"' and orden_servicio.anulado='"+anulado+"' and orden_servicio.fecha_pedidos between '"+str(fechaD)+"' and '"+str(fechaH)+"' group by orden_servicio.fecha_pedidos, servicio.idciudadOrigen, servicio.lugarCarga,orden_servicio.fecha_entrega, servicio.idCiudadDestino, servicio.lugarDestino, servicio.descripcion, vehiculo.cod_vehiculo, insumo.descripcion"
        connect.execute(query)
        datos = connect.fetchall()
        return datos

    @staticmethod
    def formateraDatosClienteActivity(lista):
        var = None
        listado = []
        for d in lista:
            fechaPedido = str(d[0])
            lugarOrigen = str(d[1]+"-"+str(d[2]))
            fechaEntrega = str(d[3])
            lugarDestino = str(d[4]+"-"+d[5])
            servicio = d[6]
            vehiculo = d[7]
            insumo = d[8]
            cantidad = d[9]
            totalInsumo = d[10]
            toltalServicio = d[11]
            saldo = d[12]
            var = {
                "fechaPedido": fechaPedido,
                "lugarOrigen": lugarOrigen,
                "fechaEntrega": fechaEntrega,
                "lugarDestino": lugarDestino,
                "servicio": servicio,
                "vehiculo": vehiculo,
                "insumo": insumo,
                "cantidad": cantidad,
                "totalInsumo": totalInsumo,
                "totalServicio": toltalServicio,
                "saldo": saldo
            }
            listado.append(var)
        return listado