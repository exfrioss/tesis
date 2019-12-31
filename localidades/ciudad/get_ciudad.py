from app import db
import MySQLdb
from localidades.departamento.get_departamento import _Depa


class _Ciudad:
    @staticmethod
    def get_ciudadOn():
        connectcion = db.connection.cursor()
        connectcion.execute("select * from ciudad where estado='1'")
        resultOn = connectcion.fetchall()
        return resultOn

    @staticmethod
    def get_CiudadOff():
        try:
            queryStartOff = db.connection.cursor()
            sql = "SELECT * FROM ciudad"

            try:
                queryStartOff.execute(sql)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                return error_message

            try:
                resultOff = queryStartOff.fetchall()
                return resultOff
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"

        except MySQLdb.Error as e:
            error_message = "MySQL Error: '" + str(e) + "'"

        finally:
            queryStartOff.close()

    @staticmethod
    def get_cityBy_depa(id):
        try:
            connect = db.connection.cursor()
            sql = "SELECT * FROM ciudad WHERE departamento_coddepa='" + \
                str(id) + "'"
            try:
                connect.execute(sql)

            except MySQLdb.Error as e:
                error_message = "MySQL error: '" + str(e) + "'"
                return error_message

            try:
                city = connect.fetchall()
                return city
            except MySQLdb.Error as e:
                error_message = "MySQL error: '" + str(e)+"'"
                return error_message
        finally:
            connect.close()

    @staticmethod
    def get_cityBy_ID(id):
        try:
            connect = db.connection.cursor()
            sql = "SELECT * FROM ciudad WHERE codciudad='" + str(id) + "'"
            try:
                connect.execute(sql)

            except MySQLdb.Error as e:
                error_message = "MySQL error: '" + str(e) + "'"
                return error_message

            try:
                city = connect.fetchall()
                return city
            except MySQLdb.Error as e:
                error_message = "MySQL error: '" + str(e)+"'"
                return error_message
        finally:
            connect.close()

    @staticmethod
    def delet_ciudad(id, usuario):
        try:
            connect = db.connection.cursor()
            queryValidator = "UPDATE ciudad SET estado='0', usuario='"+str(usuario)+"' WHERE codciudad = '"+ str(id) +"'"
            try:
                connect.execute(queryValidator)
            except MySQLdb.Error as e:
                error_message = "MySQL error: '"+ str(e) +"'"
                return error_message
            try:
                connect.connection.commit()
                ok_message = "Ciudad eliminado correctamente!!!"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "MySQL error: '"+ str(e) +"'"
        finally:
            connect.close()

    @staticmethod
    def update_ciudad(cod, descripcion, estado, depa, usuario):
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE ciudad SET descripcion = '"+str(descripcion) +
                    "', estado = '"+stdo+"', departamento_coddepa='"+str(depa)+"', usuario='"+str(usuario)+"'  WHERE codciudad = '"+str(cod)+"'")
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
    def insert_city(cod, dscp, dep, state, usuario):
        try:
            queryStart = db.connection.cursor()
            queryStart.execute("INSERT INTO ciudad (codciudad, descripcion, departamento_coddepa, estado, usuario) VALUES(%s, %s, %s, %s, %s)", (cod, dscp, dep, state, usuario))
            queryStart.connection.commit()
            ok_message = "Ciudad registrado correctamente!!!"
            print(ok_message)
            return ok_message
        except MySQLdb.Error as e:
            print(e)
            return "MySQL Error: '"+ str(e) +"'"
        finally:
            queryStart.close()

    @staticmethod
    def datosFormatedos(lista):
        cityList = []
        city = None
        dDescripcion = None
        try:
            for re in lista:
                codigo = re[0]
                descripcion = re[1]
                estado = re[2]
                depa = re[3]
                getDepa = _Depa.get_depaOnById(depa)
                for d in getDepa:
                    dDescripcion = d[1]
                city = {
                    'codigo': codigo,
                    'descripcion': descripcion,
                    'estado' : estado,
                    'departamento' : depa,
                    'dDescripcion': dDescripcion
                    }
                cityList.append(city)
            return cityList
        except:
            error_message = "Error al procesar formateo de datos"
            print(error_message)
            return error_message