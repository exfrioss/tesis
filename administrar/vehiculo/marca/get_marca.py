from flask import Flask, json, jsonify
from app import db
import MySQLdb


class Marca:
    @staticmethod
    def get_marcaOn():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM marca where estado = '1'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the region table "
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
    def get_marcaByID(id):
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM marca where codmarca = '1'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the region table "
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
    def get_marcaOff():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM marca where estado = '0'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the region table "
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
    def addMarca(descripcion):
        try:
            estado = '1'
            connect = db.connection.cursor()
            query_marca = (
                "INSERT INTO marca (descripcion, estado) VALUES('" + str(descripcion) + "', '1')")
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
    def update_marca(codregion, descripcion, estado):
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE marca SET descripcion = '"+str(descripcion) +
                    "', estado = '"+stdo+"'  WHERE codmarca = '"+str(codregion)+"'")
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
    def delete_marca(codigo):
        print(codigo)
        try:
            connect = db.connection.cursor()
            quer = (
                "UPDATE marca SET estado = '0'  WHERE codmarca = '"+str(codigo)+"'")
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
    def regularRespuesta(listaMarca):
        marcas = []
        marca = None
        try:
            for r in listaMarca:
                codigo = r[0]
                descripcion = r[1]
                estado = r[2]
                region = {
                    'codigo': codigo,
                    'descripcion': descripcion,
                    'estado': estado
                }
                marcas.append(region)
            return marcas
        except:
           return error
