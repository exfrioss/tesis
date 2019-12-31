from flask import Flask, json, jsonify
from app import db
import MySQLdb


class Tipo_Vehiculo:
    @staticmethod
    def get_tipOn():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM tipo_vehiculo where estado = '1'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the Tipo_Vehiculo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get Tipo_Vehiculo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_tipoByID(id):
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM tipo_vehiculo where idtipo_vehiculo = '"+str(id)+"'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the tipo_vehiculo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get tipo_vehiculo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_tipOff():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM tipo_vehiculo where estado = '0'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the tipo_vehiculo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get tipo_vehiculo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def addTipo(descripcion, pesoNeto, isAsociado):
        if(isAsociado):
            print(isAsociado)
            asociado = '1'
        else:
            asociado = '0'
        try:
            connect = db.connection.cursor()
            insert = (
                "INSERT INTO tipo_vehiculo (descripcion, peso_neto, isAsociado, estado) VALUES('" + str(descripcion) + "', '" + str(pesoNeto) + "','" + str(asociado) + "','1')")
            try:
                connect.execute(insert)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                return error_message
            try:
                dti = connect.connection.commit()
                ok_message = "Good insert"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
        except MySQLdb.Error as e:
            error_message = "MySQL Error: '" + str(e) + "'"
        finally:
            connect.close()

    @staticmethod
    def update_tipo(codigo, descripcion, pesoNeto, isAsociado, estado):
        print(codigo, descripcion, pesoNeto, isAsociado, estado)
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        if(isAsociado):
            print(isAsociado)
            asociado = '1'
        else:
            asociado = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE tipo_vehiculo SET descripcion = '"+str(descripcion) +
                    "', estado = '"+stdo+"', peso_neto = '"+str(pesoNeto)+
                    "', isAsociado = '"+str(asociado)+"' WHERE idtipo_vehiculo = '"+str(codigo)+"'")
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
    def delete_tipo(codigo):
        print("Procesando parametro: ", codigo)
        try:
            connect = db.connection.cursor()
            quer = (
                "UPDATE tipo_vehiculo SET estado = '0'  WHERE idtipo_vehiculo = '"+str(codigo)+"'")
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
    def regularRespuesta(lista):
        tipos = []
        tipo = None
        try:
            for r in lista:
                codigo = r[0]
                descripcion = r[1]
                pesoNeto = r[2]
                isAsociado = r[3]
                estado = r[4]
                tipo = {
                    'codigo': codigo,
                    'descripcion': descripcion,
                    'pesoNeto': pesoNeto,
                    'isAsociado': isAsociado,
                    'estado': estado
                }
                tipos.append(tipo)
            return tipos
        except:
            return error
