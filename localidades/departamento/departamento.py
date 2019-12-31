from flask import Flask, json, jsonify, render_template, request, redirect, url_for, flash
from localidades.departamento.get_departamento import _Depa
from localidades.region.get_region import _Region
from app import app, db

@app.route('/departamento') 
def departamento():
    resultCountry = _Depa.get_depaOn()
    getData = _Depa.datosFormateados(resultCountry)
    return jsonify({"departamento": getData})
    
@app.route('/departamentosActivos') 
def departamentoActivos():
    resultCountry = _Depa.get_depaActivos()
    getData = _Depa.datosFormateados(resultCountry)
    return jsonify({"departamento": getData})

@app.route('/departamento_off') 
def departamento_off():
    # resultCountry = _Depa.get_depaOn()
    resultCountryI = _Depa.get_depaOff() 
    getData = _Depa.datosFormateados(resultCountryI)
    return jsonify({"departamento": getData})

@app.route('/add_departamento/<usuario>', methods = ['POST'])
def add_departamento(usuario):
        if request.method == 'POST':
                codigo = request.get_json()['codigo']
                dscp = request.get_json()['descripcion']
                reg = request.get_json()['region']
                print(reg)
                uniqueResult = _Depa.get_depaCod(codigo)
                if(uniqueResult):
                        return jsonify({'message_Error': 'El departamento ya se encuentra registrado'})
                else:
                        state = '1'
                        ok = _Depa.insert_depa(codigo, dscp, reg, state, usuario)
                        resultCountry = _Depa.get_depaActivos()
                        getData = _Depa.datosFormateados(resultCountry)
                        return jsonify({"departamento": getData})


@app.route('/validar_departamento', methods = ['GET','POST'])
def validar_departamento():
    if request.method == 'POST':
        codigo = request.get_json()['codigo']
        print(codigo)
        result = _Depa.get_depaCod(codigo)
        print(result)
        # result = {'result': result}
        return jsonify({'result':result})

@app.route('/delete_departamento/<string:usuario>', methods=['PUT'])
def delet_departamento(usuario):
        id = request.get_json()['codigo']
        resultBeDelet = _Depa.get_depaCod(id)
        mess = _Depa.delet_depa(id, usuario)
        resultCountry = _Depa.get_depaActivos()
        getData = _Depa.datosFormateados(resultCountry)
        return jsonify({"departamento": getData})

@app.route('/update_departamento/<usuario>', methods=['PUT'])
def update_departamento(usuario):
        descripcion = request.get_json()['descripcion']
        estado = request.get_json()['estado']
        codregion = request.get_json()['codigo']
        region = request.get_json()['idregion']
        q = _Depa.update_depa(codregion, descripcion, estado, region, usuario)
        resultCountry = _Depa.get_depaActivos()
        getData = _Depa.datosFormateados(resultCountry)
        return jsonify({"departamento": getData})

 