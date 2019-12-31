import axios from "axios";
const API_URL = "http://127.0.0.1:3030";
const tipoUrl = `${API_URL}/tiposActivos`;

export const state = {
  tipos: [],
  idTipo: ""
};
export const mutations = {
  SET_DATATIPO(state, value) {
    state.tipos = value;
  },
  CREATE_DATATIPO(state, value) {
    state.tipos.push(value);
  }
};

export const actions = {
  loadTiposActivos({ commit }) {
    axios
      .get(tipoUrl)
      .then(result => {
        commit("SET_DATATIPO", result.data.tipo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadTiposInActivos({ commit }) {
    const urlInactivas = `${API_URL}/tiposInactivos`;
    axios
      .get(urlInactivas)
      .then(result => {
        commit("SET_DATATIPO", result.data.tipo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  createTipo({ commit }, value) {
    console.log(value);
    const urlAdd = `${API_URL}/addtipo`;
    axios
      .post(urlAdd, value)
      .then(result => {
        console.log(result.data.tipo);
        commit("SET_DATATIPO", result.data.tipo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  updateTipo({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    // const id = value.codigo;
    const urlAdd = `${API_URL}/updatetipo`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_DATATIPO", result.data.tipo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteTipo({ commit }, value) {
    console.log("eliminando" + value);
    const urlAdd = `${API_URL}/deletetipo/${value}`;
    axios
      .put(urlAdd)
      .then(result => {
        console.log(result.data.tipo);
        commit("SET_DATATIPO", result.data.tipo);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
