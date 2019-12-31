from app import db
import MySQLdb


class Factura:
    @staticmethod
    def guardarFactura(nroFactura, fechaE, chofer, ci, idPersonal, idPedido, talonario, usuario, total, codServicio, precio, pesoI, pesoF, subtotal, cantidad, tolerancia, iva5, iva10):
        try:
            connect = db.connection.cursor()
            cabecera = "insert into factura_cliente values('"+str(nroFactura)+"', '"+str(fechaE)+"', '0', '0', '"+str(chofer)+"', '"+str(
                ci)+"', '"+str(idPersonal)+"', '"+str(idPedido)+"', '"+str(talonario)+"', '"+str(usuario)+"', '"+str(total)+"')"
            connect.execute(cabecera)
            try:
                detalle = "insert into detalle_servicio_factura values('"+str(nroFactura)+"', '"+str(codServicio)+"', '"+str(precio)+"', '"+str(
                    pesoI)+"', '"+str(pesoF)+"', '"+str(subtotal)+"', '"+str(cantidad)+"', '0', '"+str(tolerancia)+"', '"+str(iva5)+"', '"+str(iva10)+"')"
                connect.execute(detalle)
                try:
                    update = "update orden_servicio set isfacturado = '1' where cod_pedidos='" + \
                        str(idPedido)+"'"
                    connect.execute(update)
                    connect.connection.commit()
                except MySQLdb.Error as error:
                    connect.connection.rollback()
                    print(error)
                # connect.connection.commit()
                print("good Job")
            except MySQLdb.Error as error:
                connect.connection.rollback()
                print("Detalle", error)
        except MySQLdb.Error as error:
            connect.connection.rollback()
            print("Cabecera", error)
