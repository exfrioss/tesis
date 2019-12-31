from flask import Flask, json, jsonify
from app import db
import MySQLdb


class Cargo:
    @staticmethod
    def get_cargo():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM cargo"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the cargo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get cargo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_cargoChofer():
        try:
            connect = db.connection.cursor()
            query = "SELECT codcargo FROM cargo where descripcion ='Chofer'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the cargo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get cargo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def insert_cargo(descripcion, usuario):
        try:
            estado = '1'
            connect = db.connection.cursor()
            quer = ("INSERT INTO cargo (descripcion, estado, usuario) VALUES('" +
                    str(descripcion) + "', '"+estado+"', '"+str(usuario)+"')")
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
    def update_cargo(codcargo, descripcion, estado):
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE cargo SET descripcion = '"+str(descripcion) +
                    "', estado = '"+stdo+"'  WHERE codcargo = '"+str(codcargo)+"'")
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
    def update_state(codcargo):
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE cargo SET estado = '0' WHERE codcargo = '"+str(codcargo)+"'")
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
    def get_cargoBy_Id(id):
        try:
            connect = db.connection.cursor()
            quer = "SELECT * FROM cargo WHERE codcargo = '"+str(id)+"'"
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