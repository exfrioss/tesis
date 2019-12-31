from app import db
import MySQLdb

class Talonario:
    @staticmethod
    def insertTalonario(codt, codE, fechaI, fechaF, nroI, nroA, nroF, activo, usuario):
        print(codt, codE, fechaI, fechaF, nroI, nroA, nroF, activo, usuario)
        try:
            connect = db.connection.cursor()
            sql = "insert into talonario values(0, '"+str(activo)+"','"+str(codE)+"', '"+str(fechaI)+"', '"+str(fechaF)+"', '"+str(nroI)+"', '"+str(nroA)+"', '"+str(nroF)+"', '"+str(codt)+"', '"+str(usuario)+"')"
            connect.execute(sql)
            connect.connection.commit()
        except MySQLdb.Error as error:
            print(error)
    
    @staticmethod
    def getTalonarioActivo():
        try:
            connect = db.connection.cursor()
            sql = "select * from talonario where activo='1'"
            connect.execute(sql)
            getData = connect.fetchall()
            print("good job")
            return getData
        except MySQLdb.Error as error:
            print(error)

    @staticmethod
    def getTheLastTalonarioActivo():
        try:
            connect = db.connection.cursor()
            sql = "select * from talonario where activo='1' order by idtalonario limit 1"
            connect.execute(sql)
            getData = connect.fetchall()
            print("good job")
            return getData
        except MySQLdb.Error as error:
            print(error)

    @staticmethod
    def getTalonarioInActivo():
        try:
            connect = db.connection.cursor()
            sql = "select * from talonario where activo='0'"
            connect.execute(sql)
            getData = connect.fetchall()
            print("good job")
            return getData
        except MySQLdb.Error as error:
            print(error)

    @staticmethod
    def formatearDatos(lista):
        listimbrado = []
        var = None
        for t in lista:
            cod = t[0]
            activo = t[1]
            codigoEstablecimiento = t[2]
            fechaInicioVigencia = str(t[3])
            fechaFinVigencia = str(t[4])
            nroInicio = t[5]
            norActual = t[6]
            nroFin = t[7]
            timbrado = t[8]
            usuario = t[9]
            ruc= t[10]
            var = {
                'estado': activo,
                'establecimiento': codigoEstablecimiento,
                'fechaInicioVigencia': fechaInicioVigencia,
                'fechaFinVigencia': fechaFinVigencia,
                'nroInicio': nroInicio,
                'norActual': norActual,
                'nroFin': nroFin,
                'timbrado': timbrado,
                'usuario': usuario,
                'cod': cod,
                'nroFactura': str(codigoEstablecimiento+" "+str(norActual)),
                'ruc': ruc
            }
            listimbrado.append(var)
        return listimbrado