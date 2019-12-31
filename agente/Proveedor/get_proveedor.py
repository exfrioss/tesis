from app import db
import MySQLdb

class Proveedor:
    @staticmethod
    def get_proveedor():
        try:
            connect = db.connection.cursor()
            queryProveedor = "SELECT * FROM proveedor"
            try:
                connect.execute(queryProveedor)
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
    def getProveedorById(id):
        try:
            connect = db.connection.cursor()
            queryProveedor = "SELECT * FROM proveedor where codproveedor='"+str(id)+"' "
            try:
                connect.execute(queryProveedor)
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
    def insert_proveedor(codigo, ruc, razonSocial, address, numberphone, email, fechaI, today, nombrecontacto, telefonoContacto, city, usuario):
        print(ruc)
        try:
            queryInsert = db.connection.cursor()
            sql = "INSERT INTO proveedor (codproveedor, ruc, razon_social, direccion, telefono, email, fecha_ingreso, fecha_ultima, nombre_contacto, telefono_contacto, estado, ciudad_codciudad, usuario) VALUES ('"+ str(codigo) +"', '"+ str(ruc) +"', '"+ str(razonSocial) +"', '"+ str(address) +"', '"+ str(numberphone) +"', '"+ str(email) +"', '"+ str(fechaI) +"', '"+ str(today) +"','"+ str(nombrecontacto) +"', '"+ str(telefonoContacto) +"' ,'"+ '1' +"', '"+ str(city) +"', '"+str(usuario)+"')"
            try:
                queryInsert.execute(sql)
            except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
                return error_message
            try:
                queryInsert.connection.commit()
                ok_message = "Proveedor ha sido registrado exitosamente"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "Mysql error: '"+ str(e) +"'"
        finally:
            queryInsert.close()

    @staticmethod
    def delete_proveedor(id, usuario):
        print(id)
        try:
            print("seleccionando proveedor" )
            connect = db.connection.cursor()
            sql = "UPDATE proveedor SET estado = '0', usuario='"+str(usuario)+"' WHERE codproveedor = '"+ str(id)+"'" 
            try:
                print("eliminando proveedor" )
                connect.execute(sql)
                connect.connection.commit()
                ok_message = "Proveedor ha sido eliminado correctamente!!"
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
    def update_proveedor(codigo, ruc, razonSocial, address, numberphone, estado, email, fechaI, today, nombrecontacto, city, usuario):
        try:
            connect = db.connection.cursor()
            sql = "update proveedor set usuario='"+str(usuario)+"', razon_social = '"+ str(razonSocial) +"', ruc='"+ str(ruc) +"', direccion = '"+str(address)+"', telefono = '"+ str(numberphone) +"', email ='"+ str(email) +"', fecha_ingreso = '"+str(fechaI)+"', estado = '"+estado+"' where codproveedor = '"+str(codigo)+"'"
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