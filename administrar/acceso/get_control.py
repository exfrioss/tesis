from flask import Flask, request, Blueprint, current_app
from app import db
import MySQLdb
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps

class Control:
    @staticmethod
    def controlAcceso(usuario):
        print(usuario)
        try:
            connect = db.connection.cursor()
            setControl = "select * from empleado where email = '"+str(usuario)+"' and isUsuario = '1'"
            # userLogin = "SET @usuario = '"+str(usuario)+"'"
            connect.execute(setControl)
            # connect.execute(userLogin)
            try:
                getDataAccess = connect.fetchall()
                print(getDataAccess)
                return getDataAccess
            except MySQLdb.Error as error:
                error_message = "Error Mysql: '"+error+"'"
                print(error_message)
                return error_message
        except Exception as error:
            error_message = "Error al tartar de realizar conexion: '"+str(error)+"'"
            return error_message

    @staticmethod
    def loginUser(user, evento):
        try:
            connect = db.connection.cursor()
            insertLogin = "insert into auditoria(usuario, evento, tabla) values('"+str(user)+"', '"+str(evento)+"', 'SESSION')"
            connect.execute(insertLogin)
            connect.connection.commit()
            message = "Registrado!!"
            print(message)
            return message 
        except MySQLdb.Error as error:
            print(error)
            return error