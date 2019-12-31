from app import db
import MySQLdb
from localidades.region.get_region import _Region

class _Depa:
    @staticmethod
    def get_depaOn():
        queryState = db.connection.cursor()
        queryState.execute("SELECT * FROM departamento")
        resultCountry = queryState.fetchall()
        return resultCountry

    @staticmethod
    def get_depaOnById(id):
        queryState = db.connection.cursor()
        queryState.execute("SELECT * FROM departamento where coddepa = '"+str(id)+"'")
        resultCountry = queryState.fetchall()
        return resultCountry
    

    @staticmethod
    def get_depaActivos():
        queryState = db.connection.cursor()
        queryState.execute("SELECT * FROM departamento where estado = '1'")
        resultCountry = queryState.fetchall()
        return resultCountry

    @staticmethod
    def get_depaOff():
        queryStateI = db.connection.cursor()
        queryStateI.execute("SELECT * FROM departamento WHERE estado = '0'")
        resultCountryI = queryStateI.fetchall()
        return resultCountryI

    @staticmethod
    def get_depaCod(codStat):
        print("parametro: "+codStat)
        try:
            connect = db.connection.cursor()
            query= "SELECT * FROM departamento WHERE coddepa = {0} ".format(codStat)
            try:
                connect.execute(query)
            except MySQLdb.Error as e:
                error_message = "MySQL error: '"+ str(e) +"'"
                return error_message
            try:
                resultStat = connect.fetchone()
                return resultStat
            except MySQLdb.Error as e:
                error_message = "MySQL error: '"+ str(e) +"'"
                return error_message
        except MySQLdb.Error as e:
            error_message = "MySQL error: '"+ str(e) +"'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def insert_depa(codDepa, dscp, reg, state, usuario):
        try:
            queryStart = db.connection.cursor()
            queryStart.execute("INSERT INTO departamento (coddepa, descripcion, region_codregion, estado, usuario) VALUES(%s, %s, %s, %s, %s)", (codDepa, dscp, reg, state, usuario))
            queryStart.connection.commit()
            ok_message = "Departamento registrado correctamente!!!"
            print(ok_message)
            return ok_message
        except MySQLdb.Error as e:
            print(e)
            return "MySQL Error: '"+ str(e) +"'"
        finally:
            queryStart.close()

    @staticmethod
    def delet_depa(id, usuario):
        try:
            connect = db.connection.cursor()
            queryValidator = "UPDATE departamento SET estado='0', usuario='"+str(usuario)+"' WHERE coddepa = '"+ str(id) +"'"
            try:
                connect.execute(queryValidator)
            except MySQLdb.Error as e:
                error_message = "MySQL error: '"+ str(e) +"'"
                return error_message
            try:
                connect.connection.commit()
                ok_message = "Departamento eliminado correctamente!!!"
                return ok_message
            except MySQLdb.Error as e:
                error_message = "MySQL error: '"+ str(e) +"'"
        finally:
            connect.close()

    @staticmethod
    def update_depa(codregion, descripcion, estado, region, usuario):
        print(codregion, descripcion, estado, region, usuario)
        if(estado):
            print(estado)
            stdo = '1'
        else:
            stdo = '0'
        try:
            connect = db.connection.cursor()
            quer = ("UPDATE departamento SET descripcion = '"+str(descripcion) +
                    "', estado = '"+stdo+"', region_codregion='"+str(region)+"', usuario='"+str(usuario)+"'  WHERE coddepa = '"+str(codregion)+"'")
            try:

                connect.execute(quer)
            except MySQLdb.Error as e:
                error_message = "MySQL Error: '" + str(e) + "'"
                print(error_message)
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
    def datosFormateados(lita):
        depa = None
        rdescripcion= None
        departamentoList = []
        try:
            for re in lita:
                codigo = re[0]
                descripcion = re[1]
                estado = re[2]
                idregion = re[3]
                region_des = _Region.get_regionBy_Id(idregion)
                for r in region_des:
                    rdescripcion = r[1]
                depa = {
                    'codigo': codigo,
                    'descripcion': descripcion,
                    'estado' : estado,
                    'idregion' : idregion,
                    'rdescripcion': rdescripcion
                    }
                departamentoList.append(depa)
            return departamentoList
        except:
            error_message: "Error al procesar los datos"
            print(error_message)
            return error_message
