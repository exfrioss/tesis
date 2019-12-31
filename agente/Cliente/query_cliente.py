from app import db
import MySQLdb
from localidades.ciudad.get_ciudad import _Ciudad

class Cliente:
    @staticmethod
    def get_clienteOn():
       try:
           connect = db.connection.cursor()
           queryCleinte = "SELECT * FROM cliente "
           try:
               connect.execute(queryCleinte)
           except MySQLdb.Error as e:
               error_message = "Mysql Error: '"+ str(e) +"'"
               return error_message
           try:
                resultActive = connect.fetchall()
                return resultActive
           except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
                return error_message
       except MySQLdb.Error as e:
           error_message = "Mysql Error: '"+ str(e) +"'"
           return error_message
       finally:
           connect.close()
    
    @staticmethod
    def get_cliente():
       try:
           connect = db.connection.cursor()
           queryCleinte = "SELECT * FROM cliente where estado='1' "
           try:
               connect.execute(queryCleinte)
           except MySQLdb.Error as e:
               error_message = "Mysql Error: '"+ str(e) +"'"
               return error_message
           try:
                resultActive = connect.fetchall()
                return resultActive
           except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
                return error_message
       except MySQLdb.Error as e:
           error_message = "Mysql Error: '"+ str(e) +"'"
           return error_message
       finally:
           connect.close()

    @staticmethod
    def get_clienteOff():
       try:
           connect = db.connection.cursor()
           queryCleinte = "SELECT * FROM cliente WHERE estado = '0'"
           try:
               connect.execute(queryCleinte)
           except MySQLdb.Error as e:
               error_message = "Mysql Error: '"+ str(e) +"'"
               return error_message
           try:
                resultI = connect.fetchall()
                return resultI
           except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
       except MySQLdb.Error as e:
           error_message = "Mysql Error: '"+ str(e) +"'"
       finally:
           connect.close()

    @staticmethod
    def get_cliente_For_ID(id):
        try:
            connect = db.connection.cursor()
            sql = "select * from cliente where ci_numero = '"+ str(id) +"'"
            try:
               connect.execute(sql)
            except MySQLdb.Error as e:
                error_message = "Error al realizar consulta: '"+str(e)+"'"
                return error_message
            try:
                get_Data = connect.fetchall()
                return get_Data
            except MySQLdb.Error as e:
                error_message = "Error al obtener datos: '"+ str(e) +"'"
                return error_message
        finally:
            connect.close()

    @staticmethod
    def insert_client(cinumber, ruc, name, lastname, address, email, city, numberphone, fechaInicio, birthday, sex, today, password, esUsuario, usuario):
        print(cinumber, ruc, name, lastname, address, email, city, numberphone, fechaInicio, birthday, sex, today, password)
        try:
            queryInsert = db.connection.cursor()
            sql = "INSERT INTO cliente (ci_numero, nombre, apellido, direccion, telefono, email, ruc, sexo, fecha_ingreso, fecha_nacimiento, fecha_ultima, estado, password, ciudad_codciudad, isUsuario, usuario) VALUES ('"+str(cinumber)+"', '"+ str(name) +"', '"+ str(lastname) +"', '"+ str(address) +"', '"+ str(numberphone) +"', '"+ str(email) +"', '"+ str(ruc) +"', '"+ str(sex) +"', '"+ fechaInicio+"', '"+ birthday +"', '"+ today +"', '"+ '1' +"', '"+str(password)+"', '"+ str(city) +"', '"+esUsuario+"', '"+str(usuario)+"')"
            try:
                queryInsert.execute(sql)
            except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
                return error_message
            try:
                queryInsert.connection.commit()
                ok_message = "Cliente ha sido registrado exitosamente"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
        finally:
            queryInsert.close()

    @staticmethod
    def delete_customer(id, usuario):
        print(id)
        try:
            print("seleccionando cliente" )
            connect = db.connection.cursor()
            sql = "UPDATE cliente SET estado = '0', usuario='"+usuario+"' WHERE ci_numero = '"+ str(id)+"'" 
            try:
                print("eliminando cliente" )
                connect.execute(sql)
                connect.connection.commit()
                ok_message = "Cliente ha sido eliminado correctamente!!"
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
    def update_customer(id, state, ruc, name, lastname, address, email, city, numberphone, birthday, fechaInicio, sex, password, esUsuario, usuario):
        try:
            connect = db.connection.cursor()
            sql = "update cliente set nombre = '"+ str(name) +"', apellido = '"+str(lastname)+"', ruc='"+str(ruc)+"', direccion = '"+str(address)+"', telefono = '"+ str(numberphone) +"', email ='"+ str(email) +"', sexo = '"+str(sex)+"', fecha_nacimiento = '"+birthday+"', estado = '"+state+"', ciudad_codciudad='"+str(city)+"', fecha_ingreso='"+fechaInicio+"', password='"+str(password)+"', isUsuario='"+esUsuario+"', usuario='"+str(usuario)+"' where ci_numero = '"+str(id)+"'"
            try:
                connect.execute(sql)
            except MySQLdb.Error as e:
                error_message = "Error al ejecutar la setencia: '"+ str(e) +"'"
                return error_message
            try:
                connect.connection.commit()
                updated_data = "Updated Data"
                return updated_data
            except MySQLdb.Error as e:
                error_message = "Failed update: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "Failed connection: '"+str(e)+"'"
            return error_message
        finally:
            connect.close()


    @staticmethod
    def datosFormateados(lista):
        list_c = []
        cDescripcion = None
        cli = None
        try:
            for c in lista:
                codigo = c[0]
                nombre = c[1]
                apellido = c[2]
                direccion = c[3]
                telefono = c[4]
                email = c[5]
                ruc = c[6]
                sexo = c[7]
                fechaN = c[8]
                fechaI = c[9]
                fechaU = c[10]
                sfechaN = str(fechaN)
                sfechaI = str(fechaI)
                estado = c[11]
                city = c[13]
                isUsuario = c[14]
                getC = _Ciudad.get_cityBy_ID(city)
                for c in getC:
                    cDescripcion = c[1]
                cli = {
                    'codigo': codigo,
                    'nombre': nombre,
                    'apellido': apellido,
                    'direccion': direccion,
                    'telefono': telefono,
                    'email' : email,
                    'ruc': ruc,
                    'sexo': sexo,
                    'fechaN': fechaN,
                    'fechaI': fechaI,
                    'fechaU': fechaU,
                    'estado': estado,
                    'city': city,
                    'sfechaN':sfechaN,
                    'sfechaI':sfechaI,
                    'cDescripcion' : cDescripcion,
                    'isUsuario': isUsuario,
                }
                list_c.append(cli)
            return list_c
        except:
            error_message = "Error al formatear datos"
            print(error_message)
            return error_message
        