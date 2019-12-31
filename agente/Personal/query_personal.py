from app import db
import MySQLdb
from localidades.ciudad.get_ciudad import _Ciudad
from agente.cargo.get_cargo import Cargo

class Personal:
    @staticmethod
    def get_personal():
        try:
            connect = db.connection.cursor()
            queryPersonal = "SELECT * FROM empleado"
            try:
                connect.execute(queryPersonal)
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
            try:
                result  = connect.fetchall()
                return result
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Mysql Error: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close()
    
    @staticmethod
    def get_UsuarioSistema():
        try:
            connect = db.connection.cursor()
            queryPersonal = "SELECT * FROM empleado where isusuario='1'"
            try:
                connect.execute(queryPersonal)
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
            try:
                result  = connect.fetchall()
                return result
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Mysql Error: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def get_Chofer(cod):
        try:
            connect = db.connection.cursor()
            queryPersonal = "SELECT * FROM empleado where cargo_codcargo = '"+str(cod)+"'"
            try:
                connect.execute(queryPersonal)
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
            try:
                result  = connect.fetchall()
                return result
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Mysql Error: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def get_personalOn():
        try:
            connect = db.connection.cursor()
            queryPersonal = "SELECT * FROM empleado where estado = '1'"
            try:
                connect.execute(queryPersonal)
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
            try:
                result  = connect.fetchall()
                return result
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Mysql Error: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def get_personalOff():
        try:
            connect = db.connection.cursor()
            queryPersonal = "SELECT * FROM empleado where estado = '0'"
            try:
                connect.execute(queryPersonal)
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
            try:
                result  = connect.fetchall()
                return result
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Mysql Error: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def getPersonalById(id):
        try:
            connect = db.connection.cursor()
            queryPersonal = "SELECT * FROM empleado where cod_empleado = '"+str(id)+"'"
            try:
                connect.execute(queryPersonal)
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
            try:
                result  = connect.fetchall()
                return result
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Mysql Error: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def getPersonalByEmail(id):
        try:
            connect = db.connection.cursor()
            queryPersonal = "SELECT * FROM empleado where email = '"+str(id)+"'"
            try:
                connect.execute(queryPersonal)
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
            try:
                result  = connect.fetchall()
                return result
            except MySQLdb.Error as e:
                error_message = "Mysql Error: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Mysql Error: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close()


    @staticmethod
    def insert_employee(ruc, name, lastname, address, email, city, numberphone, birthday, fingreso ,today, esUsuario, password, cargo, sexo, usuario):
        print(ruc, name, lastname, address, email, city, numberphone, birthday, fingreso ,today, esUsuario, password, cargo, sexo)
        try:
            queryInsert = db.connection.cursor()
            sql = "INSERT INTO empleado (ruc, nombre, apellido, direccion, email, telefono, fecha_nacimiento, fecha_ingreso, fecha_ultima, ciudad_codciudad, estado, password, cargo_codcargo, isUsuario, sexo, usuario) VALUES ('"+ str(ruc) +"', '"+ str(name) +"', '"+ str(lastname) +"', '"+ str(address) +"', '"+ str(email) +"', '"+ str(numberphone) +"', '"+ birthday +"', '"+ fingreso +"', '"+ today +"','"+ str(city) +"', '"+ '1' +"', '"+ str(password) +"', '"+ str(cargo) +"', '"+ str(esUsuario) +"', '"+str(sexo)+"', '"+str(usuario)+"')"
            try:
                queryInsert.execute(sql)
            except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
                print(error_message)
                return error_message
            try:
                queryInsert.connection.commit()
                ok_message = "Cliente ha sido registrado exitosamente"
                print(ok_message)
                return ok_message
            except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
                print(error_message)
        finally:
            queryInsert.close()

    @staticmethod
    def delete_employee(id, usuario):
        print(id)
        try:
            print("seleccionando empleado" )
            connect = db.connection.cursor()
            sql = "UPDATE empleado SET estado = '0', usuario='"+str(usuario)+"' WHERE cod_empleado = '"+ str(id)+"'" 
            try:
                print("eliminando empleado" )
                connect.execute(sql)
                connect.connection.commit()
                ok_message = "Empleado ha sido eliminado correctamente!!"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "Error al ejecutar la sentencia sql: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Error en la conexion: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close

    @staticmethod
    def update_employee(idE, ruc, name, lastname, address, email, city, numberphone, birthday, cargo, sexo, esUsuario, estado, usuario):
        print(idE, ruc, name, lastname, address, email, city, numberphone, birthday, cargo, sexo, esUsuario, estado)
        try:
            connect = db.connection.cursor()
            sql = "update empleado set ruc='"+ str(ruc) +"', nombre = '"+ str(name) +"', apellido = '"+str(lastname)+"', direccion = '"+str(address)+"', email ='"+ str(email) +"', ciudad_codciudad = '"+str(city)+"', telefono = '"+ str(numberphone) +"', fecha_nacimiento = '"+birthday+"', isUsuario='"+esUsuario+"', cargo_codcargo='"+str(cargo)+"', sexo='"+str(sexo)+"', estado = '"+str(estado)+"', usuario='"+str(usuario)+"' where cod_empleado = '"+str(idE)+"'"
            try:
                connect.execute(sql)
            except MySQLdb.Error as e:
                error_message = "Error al ejecutar la setencia: '"+ str(e) +"'"
                print(error_message)
                return error_message
            try:
                connect.connection.commit()
                updated_data = "Updated Data"
                return updated_data
            except MySQLdb.Error as e:
                error_message = "Failed update: '"+ str(e) +"'"
                print(error_message)
                return error_message
        except MySQLdb.Error as e:
            error_message = "Failed connection: '"+str(e)+"'"
            return error_message
        finally:
            connect.close()


    @staticmethod
    def datosFormateados(lista):
            ciudad = None
            listEmployee = []
            cargo = None
            employee = None
        # try:
            for e in lista:
                codigo = e[0]
                ruc = e[1]
                nombre = e[2]
                apellido = e[3]
                direccion = e[4]
                email = e[5]
                telefono = e[6]
                fechaN = e[7]
                fechaI = e[8]
                fechaU = e[9]
                sfechaN = str(fechaN)
                sfechaI = str(fechaI)
                sfechaU = str(fechaU)
                city = e[10]
                sexo = e[15]
                getCiudad = _Ciudad.get_cityBy_ID(city)
                for cd in getCiudad:
                    ciudad = cd[1]
                estado = e[11]
                idcargo = e[13]
                isUsuario = e[14]
                password = e[12]
                getCargo = Cargo.get_cargoBy_Id(idcargo)
                for c in getCargo:
                    cargo = c[1]
                employee = {
                    'codigo': codigo,
                    'ruc': ruc,
                    'nombre': nombre,
                    'apellido': apellido,
                    'direccion': direccion, 
                    'email': email,
                    'telefono': telefono,
                    'fechaN': fechaN,
                    'fechaI': fechaI,
                    'fechaU': fechaU,
                    'estado': estado,
                    'city': city,
                    'idcargo': idcargo,
                    'cargo': cargo,
                    'isUsuario': isUsuario,
                    'ciudadNombre': ciudad,
                    'sfechaN': sfechaN,
                    'sfechaI': sfechaI,
                    'sfechaU': sfechaU,
                    'sexo': sexo,
                    'password': password
                }
                listEmployee.append(employee)
            return listEmployee
        # except:
            error_message = 'Error al obtener datos de los empleados'
            return error_message