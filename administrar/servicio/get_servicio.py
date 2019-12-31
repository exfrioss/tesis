from flask import Flask, json, jsonify
from agente.Personal.query_personal import Personal
from app import db
import MySQLdb
from administrar.proveedor.insumo.get_insumo import Insumo
from localidades.ciudad.get_ciudad import _Ciudad

 
class Servicio:
    @staticmethod
    def get_serviciOn():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM servicio where estado = '1'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the servicio table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get servicio data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_servicio():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM servicio"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the servicio table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get servicio data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_servicioByID(id):
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM servicio where cod_servicio = '"+str(id)+"'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the cod_servicio table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get cod_servicio data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_serviciOff():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM servicio where estado = '0'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the servicio table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get servicio data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def addServicio(descripcion, precio, iva, lugarCarga, lugarDestino, idCiudadOrigen, idCiudadDestino, estado, codVehiculo):
        print(descripcion, precio, iva, lugarCarga, lugarDestino, idCiudadOrigen, idCiudadDestino, estado, codVehiculo)
        try:
            connect = db.connection.cursor()
            insert = (
                "INSERT INTO servicio (descripcion, precio, iva, estado, vehiculo_cod_vehiculo, lugarCarga, lugarDestino, idciudadOrigen, idCiudadDestino) VALUES('"+ str(descripcion) + "', '"+str(precio)+"', '" + str(iva) + "', '1', '" + str(codVehiculo) + "', '"+str(lugarCarga)+"', '"+str(lugarDestino)+"', '"+str(idCiudadOrigen)+"', '"+ str(idCiudadDestino)+"')")
            try:
                connect.execute(insert)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                print(error_message)
                return error_message
            try:
                dti = connect.connection.commit()
                print(dti)
                ok_message = "Good insert"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
        except MySQLdb.Error as e:
            error_message = "MySQL Error: '" + str(e) + "'"
        finally:
            connect.close()

    @staticmethod
    def update_servicio(codigo, descripcion, precio, iva, lugarCarga, lugarDestino, idCiudadOrigen, idCiudadDestino, estado, idVehiculo):
        print(descripcion, precio, iva, lugarCarga, lugarDestino, idCiudadOrigen, idCiudadDestino, estado, idVehiculo)
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("update servicio set descripcion = '" +str(descripcion)+
            "', precio='" +str(precio)+ "', estado= '"+stdo+"', iva='" +str(iva)+ "', lugarCarga = '" +str(lugarCarga)+ 
            "', lugarDestino='"+str(lugarDestino)+"', idCiudadOrigen = '" +str(idCiudadOrigen)+ 
            "', idCiudadDestino='" +str(idCiudadDestino)+ "' where cod_servicio = '" +str(codigo)+ "'")
            try:

                connect.execute(quer)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                return error_message
            try:
                dti = connect.connection.commit()
                print(dti)
                ok_message = "Good update"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                print(error_message)
        except MySQLdb.Error as e:
            error_message = "MySQL Error: '" + str(e) + "'"
            print(error_message)
        finally:
            connect.close()

    @staticmethod
    def delete_servicio(codigo):
        print("Procesando parametro: ", codigo)
        try:
            connect = db.connection.cursor()
            quer = (
                "UPDATE servicio SET estado = '0'  WHERE cod_servicio = '"+str(codigo)+"'")
            try:
                connect.execute(quer)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                return error_message
            try:
                dti = connect.connection.commit()
                ok_message = "Good update"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
        except MySQLdb.Error as e:
            error_message = "MySQL Error: '" + str(e) + "'"
        finally:
            connect.close()

    @staticmethod
    def insert_Insumo_in_Servicio(codServicio, lista):
        print(lista)
        try:
            connect = db.connection.cursor()
            for l in lista: 
                insert = "insert into detalle_insumo_servicio (insumo_cod_insumo, servicio_cod_servicio, descripcion, cantidad, precio, total) values('"+str(l['codigo'])+"', '"+str(codServicio)+"', '"+str(l['descripcion'])+"', '"+str(l['cantidad'])+"', '"+str(l['precio'])+"', '"+str(l['subtotal'])+"')"
                connect.execute(insert)
                getInsumo = Insumo.getInsumoById(l['codigo'])
                for i in getInsumo:
                    if float(i[5]) >= float(l['cantidad']):
                        ncantidad = float(i[5]) - float(l['cantidad'])
                        updateInsumo = "update insumo set stock_actual='"+str(ncantidad)+"' where cod_insumo='"+str(l['codigo'])+"'"
                        connect.execute(updateInsumo)
            connect.connection.commit()
            success = "Los insumos han sido asignados correctamente"
            print(success)
            return success
        except MySQLdb.Error as error:
            connect.connection.rollback()
            error_message = "Error al asignar insumos al Servicio, verifique su stock, '"+str(error)+"'"
            print(error)
            return error_message
        finally:
            connect.close()

    @staticmethod
    def regularRespuesta(lista):
        servicios = []
        servicio = None
        cEmpleado = None
        nEmpleado = None
        aEmpleado = None
        dCiudadOrigen = None
        dCiudadDestino = None
        try:
            for r in lista:
                codigo = r[0]
                descripcion = r[1]
                precio = r[2]
                iva = r[3]
                estado = r[4]
                idVehiculo = r[5]             
                origen = r[6]
                destino = r[7]
                idDestino = r[9]
                getCiudadD = _Ciudad.get_cityBy_ID(idDestino)
                for dc in getCiudadD:
                    dCiudadDestino = dc[1]
                idOrigen = r[8]
                getCiudadO = _Ciudad.get_cityBy_ID(idOrigen)
                for oc in getCiudadO:
                    dCiudadOrigen = oc[1]
                servicio = {
                    'codigo': codigo,
                    'descripcion': descripcion,
                    'precio': precio,
                    'iva': iva,
                    'estado': estado,
                    'idVehiculo': idVehiculo,
                    'origen': origen,
                    'destino': destino,
                    'idOrigen': idOrigen,
                    'idDestino': idDestino,
                    'dCiudadOrigen': dCiudadOrigen,
                    'dCiudadDestino': dCiudadDestino
                }
                servicios.append(servicio)
            return servicios
        except:
            return error
