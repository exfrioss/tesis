from flask import Flask, json, jsonify
from app import db
import MySQLdb

 
class Modelo:
    @staticmethod
    def get_modeloOn():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM modelo where estado = '1'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the modelo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get modelo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_modeloByID(id):
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM modelo where codModelo = '1'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the modelo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get modelo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_modeloOff():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM modelo where estado = '0'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the modelo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get region data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def addModelo(anio, descripcion):
        try:
            connect = db.connection.cursor()
            query_marca = (
                "INSERT INTO modelo (anio, descripcion, estado) VALUES('"+str(anio)+"', '" + str(descripcion) + "', '1')")
            try:
                connect.execute(query_marca)
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
    def update_modelo(codregion, anio, descripcion, estado):
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE modelo SET descripcion = '"+str(descripcion) +
                    "', estado = '"+stdo+"', anio = '"+str(anio)+"' WHERE codModelo = '"+str(codregion)+"'")
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
    def delete_modelo(codigo):
        print(codigo)
        try:
            connect = db.connection.cursor()
            quer = (
                "UPDATE modelo SET estado = '0'  WHERE codModelo = '"+str(codigo)+"'")
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
    def regularRespuesta(listaModelo):
        modelos = []
        modelo = None
        try:
            for r in listaModelo:
                codigo = r[0]
                anio = r[1]
                descripcion = r[2]
                estado = r[3]
                modelo = {
                    'codigo': codigo,
                    'anio': anio,
                    'descripcion': descripcion,
                    'estado': estado
                }
                modelos.append(modelo)
            return modelos
        except:
           return error
