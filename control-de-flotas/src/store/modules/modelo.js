import axios from "axios";
const API_URL = "http://127.0.0.1:3030";
const modeloUrl = `${API_URL}/modelosActivos`;

export const state = {
  modelos: [],
  idModelo: ""
};
export const mutations = {
  SET_MODELO(state, value) {
    state.modelos = value;
  },
  CREATE_MODELO(state, value) {
    state.modelos.push(value);
  }
};

export const actions = {
  loadModelosActivas({ commit }) {
    axios
      .get(modeloUrl)
      .then(result => {
        commit("SET_MODELO", result.data.modelo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadModelosInActivas({ commit }) {
    const urlInactivas = `${API_URL}/modelosInactivos`;
    axios
      .get(urlInactivas)
      .then(result => {
        commit("SET_MODELO", result.data.modelo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  createModelo({ commit }, value) {
    console.log(value);
    const urlAdd = `${API_URL}/addModelo`;
    axios
      .post(urlAdd, value)
      .then(result => {
        console.log(result.data.modelo);
        commit("SET_MODELO", result.data.modelo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  updateModelo({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    // const id = value.codigo;
    const urlAdd = `${API_URL}/updateModelo`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_MODELO", result.data.modelo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteModelo({ commit }, value) {
    const urlAdd = `${API_URL}/deleteModelo/${value}`;
    axios
      .put(urlAdd)
      .then(result => {
        console.log(result.data.modelo);
        commit("SET_MODELO", result.data.modelo);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
