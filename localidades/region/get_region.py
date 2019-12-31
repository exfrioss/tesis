from flask import Flask, json, jsonify
from app import db
import MySQLdb


class _Region:
    @staticmethod
    def get_regionOn():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM region"
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
    def get_regionOff():
        try:
            connect = db.connection.cursor()
            query1 = "SELECT descripcion, codregion FROM region WHERE estado = '1'"
            try:
                connect.execute(query1)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                return error_message
            try:
                dti = connect.fetchall()
                return dti
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
        except MySQLdb.Error as e:
            error_message = "MySQL Error: '" + str(e) + "'"
        finally:
            connect.close()

    @staticmethod
    def get_regionBy_Id(id):
        try:
            connect = db.connection.cursor()
            quer = "SELECT * FROM region WHERE codregion = '"+str(id)+"'"
            try:
                connect.execute(quer)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                return error_message
            try:
                dti = connect.fetchall()
                return dti
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
        except MySQLdb.Error as e:
            error_message = "MySQL Error: '" + str(e) + "'"
        finally:
            connect.close()

    @staticmethod
    def insert_region(codregion, descripcion, usuario):
        try:
            estado = '1'
            connect = db.connection.cursor()
            quer = ("INSERT INTO region (codregion, descripcion, estado, usuario) VALUES('" +
                    str(codregion) + "', '" + str(descripcion) + "', '"+estado+"', '"+str(usuario)+"')")
            try:
                connect.execute(quer)
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
    def update_region(codregion, descripcion, estado, usuario):
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE region SET descripcion = '"+str(descripcion) +
                    "', estado = '"+stdo+"', usuario='"+str(usuario)+"'  WHERE codregion = '"+str(codregion)+"'")
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
    def update_state(codregion, usuario):
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE region SET estado = '0', usuario='"+str(usuario)+"' WHERE codregion = '"+str(codregion)+"'")
            try:
                connect.execute(quer)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                return error_message
            try:
                dti = connect.connection.commit()
                ok_message = "Good updated"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
        except MySQLdb.Error as e:
            error_message = "MySQL Error: '" + str(e) + "'"
        finally:
            connect.close()


    @staticmethod
    def datosFormateados(lista):
        regiones = []
        region = None
        try:
            for r in lista:
                codigo = r[0]
                descripcion = r[1]
                estado = r[2]
                region = {
                    'codigo': codigo,
                    'descripcion': descripcion,
                    'estado': estado
                    }
                regiones.append(region)
            return regiones
        except:
            error_message= "Ha ocurrido un error"
            return error_message
