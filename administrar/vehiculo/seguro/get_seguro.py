from flask import Flask, json, jsonify
from app import db
import MySQLdb


class Seguro:
    @staticmethod
    def get_segurOn():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM seguro where estado = '1'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the seguro table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get seguro data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_seguroByID(id):
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM seguro where numero_contrato = '"+str(id)+"'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the seguro table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get seguro data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_segurOff():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM seguro where estado = '0'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the seguro table "
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
    def addSeguro(codigo, descripcion, fechaInicio, fechaFin, costo):
        try:
            connect = db.connection.cursor()
            query_seguro = (
                "INSERT INTO seguro (numero_contrato, descripcion, fecha_inicio, fecha_fin, costo, estado) VALUES('"+str(codigo)+"', '" + str(descripcion) + "', '" + str(fechaInicio) + "','" + str(fechaFin) + "','" + str(costo) + "', '1')")
            try:
                connect.execute(query_seguro)
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
    def update_seguro(codigo, descripcion, fechaInicio, fechaFin, costo, estado):
        print(codigo, descripcion, fechaInicio, fechaFin, costo, estado)
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE seguro SET descripcion = '"+str(descripcion) +
                    "', estado = '"+stdo+"', fecha_inicio = '"+str(fechaInicio)+
                    "', fecha_fin = '"+str(fechaFin)+"' WHERE numero_contrato = '"+str(codigo)+"'")
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
    def delete_seguro(codigo):
        print(codigo)
        try:
            connect = db.connection.cursor()
            quer = (
                "UPDATE seguro SET estado = '0'  WHERE numero_contrato = '"+str(codigo)+"'")
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
    def regularRespuesta(listaSeguro):
        seguros = []
        seguro = None
        try:
            for r in listaSeguro:
                codigo = r[0]
                descripcion = r[1]
                fechaI = r[2]
                fechaIString = str(fechaI)
                fechaF = r[3]
                fechaFString = str(fechaF)
                costo = r[4]
                estado = r[5]
                seguro = {
                    'codigo': codigo,
                    'descripcion': descripcion,
                    'fechaIString': fechaIString,
                    'fechaI': fechaI,
                    'fechaF': fechaF,
                    'fechaFString': fechaFString,
                    'costo': costo,
                    'estado': estado
                }
                seguros.append(seguro)
            return seguros
        except:
            return error
