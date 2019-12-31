from flask import Flask, json, jsonify
from administrar.vehiculo.marca.get_marca import Marca
from administrar.vehiculo.modelo.get_modelo import Modelo
from administrar.vehiculo.tipo.get_tipo_Vehiculo import Tipo_Vehiculo
from administrar.vehiculo.seguro.get_seguro import Seguro
from app import db
import MySQLdb

 
class Vehiculo:
    @staticmethod
    def get_vehiculOn():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM vehiculo where estado = '1'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the Vehiculo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get Vehiculo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_vehiculoByID(id):
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM vehiculo where cod_vehiculo = '"+str(id)+"'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the vehiculo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get vehiculo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def get_vehiculOff():
        try:
            connect = db.connection.cursor()
            query = "SELECT * FROM vehiculo where estado = '0'"
            try:
                connect.execute(query)
            except:
                error_message = "There was an error processing the query to the vehiculo table "
                return error_message
            try:
                dta = connect.fetchall()
                return dta
            except:
                error_message = "An error occurred while trying to get vehiculo data"
        except:
            error_message = "An error occurred while trying to connect to Database"
        finally:
            connect.close()

    @staticmethod
    def addVehiculo(codigo, chasis, nroMotor, idTipo, codModelo, codMarca, numeroSeguro):
        print(codigo, chasis, nroMotor, idTipo, codModelo, codMarca, numeroSeguro)
        try:
            connect = db.connection.cursor()
            insert = (
                "INSERT INTO vehiculo (cod_vehiculo, chasis, nroMotor, estado, tipo_vehiculo_idtipo_vehiculo, modelo_codModelo, marca_codmarca, seguro_numero_contrato) VALUES('" 
                + str(codigo) + "', '"+str(chasis)+"', '" + str(nroMotor) + "','1','" + str(idTipo) + "','" + str(codModelo) + "','" + str(codMarca) + "','" + str(numeroSeguro) + "')")
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
    def update_vehiculo(codigo, chasis, nroMotor, estado, idTipo, codModelo, codMarca, numeroSeguro):
        print(codigo, chasis, nroMotor, idTipo, codModelo, codMarca, numeroSeguro)
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE vehiculo SET nroMotor = '"+str(nroMotor) +
                    "', estado = '"+stdo+"', tipo_vehiculo_idtipo_vehiculo = '"+str(idTipo)+
                    "', modelo_codModelo = '"+str(codModelo)+"', marca_codmarca='"+str(codMarca)+"', seguro_numero_contrato = '"+str(numeroSeguro)+"', chasis = '"+str(chasis)+"' WHERE cod_vehiculo = '"+str(codigo)+"'")
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
    def delete_vehiculo(codigo):
        print("Procesando parametro: ", codigo)
        try:
            connect = db.connection.cursor()
            quer = (
                "UPDATE vehiculo SET estado = '0'  WHERE cod_vehiculo = '"+str(codigo)+"'")
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
        tiposPeso = None
        tipoLongitud = None
        titpoisAsociado = None
        tipoDescripcion = None
        vehiculos = []
        vehiculo = None
        mDescripcion = None
        mAnio = None
        maDescripcion = None
        sDescripcion = None
        try:
            for r in lista:
                codigo = r[0]
                chasis = r[1]
                nroMotor = r[2]
                estado = r[3]
                tipo = r[4]
                getTipo = Tipo_Vehiculo.get_tipoByID(tipo)
                for t in getTipo:
                    tiposPeso = t[2]
                    tipoLongitud = t[5]
                    tipoDescripcion = t[1]
                    titpoisAsociado = t[3]
                modelo = r[5]
                getModelo = Modelo.get_modeloByID(modelo)
                for m in getModelo:
                    mDescripcion = m[2]
                    mAnio = m[1]
                marca = r[6]
                getMarca = Marca.get_marcaByID(marca)
                for ma in getMarca:
                    maDescripcion = ma[1]
                seguro = r[7]
                getSeguro = Seguro.get_seguroByID(seguro)
                for s in getSeguro:
                    sDescripcion = s[1]
                vehiculo = {
                    'codigoVehiculo': codigo,
                    'chasis': chasis,
                    'nroMotor': nroMotor,
                    'estadoVehiculo': estado,
                    'idtipo': tipo,
                    'tDescripcion': tipoDescripcion,
                    'tPesoNeto': tiposPeso,
                    'tIsAsociado': titpoisAsociado,
                    'tipoLongitud': tipoLongitud,
                    'idmodelo': modelo,
                    'mDescripcion': mDescripcion,
                    'mAnio': mAnio,
                    'idmarca': marca,
                    'maDescripcion': maDescripcion,
                    'idseguro': seguro,
                    'sDescripcion': sDescripcion
                }
                vehiculos.append(vehiculo)
            return vehiculos
        except:
            return error
