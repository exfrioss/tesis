from app import db
import MySQLdb


class Insumo:
    @staticmethod
    def getInsumo():
       try:
           connect = db.connection.cursor()
           queryInsumo = "SELECT * FROM insumo "
           try:
               connect.execute(queryInsumo)
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
    def getInsumoStockMinimo():
       try:
           connect = db.connection.cursor()
           queryInsumo = "SELECT * FROM insumo where stock_actual <= stock_minimo"
           try:
               connect.execute(queryInsumo)
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
    def getInsumoById(id):
        try:
            connect = db.connection.cursor()
            query_id = "select * from insumo where cod_insumo = '"+str(id)+"'"
            try:
                connect.execute(query_id)
            except MySQLdb.Error as error:
                error_message: "Mysql Error: '"+str(error)+"'"
                return error_message
            try:
                insumoById = connect.fetchall()
                return insumoById
            except expression as identifier:
                pass
        except MySQLdb as error:
            error_message= "Error Mysql: '"+str(error)+"'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def insertInsumo(cod_insumo, descripcion, precio, iva, stock_ideal, stock_minimo, usuario):
        stock = 0
        # print(cod_insumo, descripcion, precio, iva, stock_ideal, stock_minimo, stock)
        try:
            connect = db.connection.cursor()
            queryInsert = "INSERT INTO insumo (cod_insumo, descripcion, precio, iva, stock_ideal, stock_actual, stock_minimo, estado, usuario) VALUES ('"+str(cod_insumo)+"', '"+str(descripcion)+"', '"+str(precio)+"', '"+iva+"', '"+str(stock_ideal)+"', '"+str(stock)+"', '"+str(stock_minimo)+"', '1', '"+str(usuario)+"')"
            try:
                connect.execute(queryInsert)
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+str(error)+"'"
            try:
                connect.connection.commit()
                success_message = "Insumo há sido registrado correctamente"
                return success_message
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+error+"'"
        except MySQLdb.Error as error:
            error_messge = "Mysql Error: '"+str(error)+"'"
        finally:
            connect.close() 

    @staticmethod
    def deleteInsumo(codInsumo, usuario):
        try:
            connect = db.connection.cursor()
            deleteInsumo = "Update insumo set estado = '0', usuario='"+str(usuario)+"' where cod_insumo = '"+str(codInsumo)+"'"
            try:
                connect.execute(deleteInsumo)
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+str(error)+"'"
                return error_message
            try:
                connect.connection.commit()
                sucess_message = "Registro actualizado"
                return sucess_message
            except MySQLdb.Error as error:
                error_message = "Error Mysql: '"+str(error)+"'"
        except MySQLdb.Error as error:
            error_message= "Mysql Error: '"+str(error)+"'"
        finally:
            connect.close()

    @staticmethod
    def updateInsumo(cod_insumo, descripcion, precio, iva, estado, stock_actual, stock_ideal, stock_minimo, usuario):
        try:
            connect = db.connection.cursor()
            updateInsumo = "update insumo set usuario='"+str(usuario)+"', descripcion = '"+str(descripcion)+"', precio = '"+str(precio)+"', iva = '"+str(iva)+"', stock_ideal = '"+str(stock_ideal)+"', estado = '"+str(estado)+"', stock_actual = '"+str(stock_actual)+"', stock_minimo = '"+str(stock_minimo)+"' where cod_insumo = '"+str(cod_insumo)+"' "
            try:
                connect.execute(updateInsumo)
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+str(error)+"'"
                return error_message
            try:
                connect.connection.commit()
                sucees_message = "Registro actualizado"
                return success_message
            except MySQLdb.Error as error:
                error_message = "Mysql Error: '"+str(error)+"'"
                return error_message
        except MySQLdb.Error as error:
            error_message = "Mysql Error: '"+str(error)+"'"
            return error_message
        finally:
            connect.close()

    @staticmethod
    def formatearDatos(lista):
        print(lista)
        listInsumo = []
        insumo = None
        try:
            for ins in lista:
                codigo = ins[0]
                descripcion = ins[1]
                precio = ins[2]
                iva = ins[3]
                stock_ideal = ins[4]
                stock_actual = ins[5]
                stock_minimo = ins[6]
                estado = ins[7]
                insumo = {
                    'codigo': codigo,
                    'descripcion': descripcion,
                    'precio': precio,
                    'iva': iva,
                    'stock_ideal': stock_ideal,
                    'stock_actual': stock_actual,
                    'stock_minimo': stock_minimo,
                    'estado': estado
                }
                listInsumo.append(insumo)
            print(listInsumo)
            return listInsumo
        except:
            error_mesage = "Error al obtener datos"
            return error_mesage
