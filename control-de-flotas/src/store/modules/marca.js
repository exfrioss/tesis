import axios from "axios";
const API_URL = "http://127.0.0.1:3030";
const marcaUrl = `${API_URL}/marcasActivas`;

export const state = {
  marcas: [],
  idMarca: ""
};
export const mutations = {
  SET_MARCA(state, value) {
    state.marcas = value;
  },
  CREATE_MARCA(state, value) {
    state.marcas.push(value);
  }
};

export const actions = {
  loadMarcasActivas({ commit }) {
    axios
      .get(marcaUrl)
      .then(result => {
        commit("SET_MARCA", result.data.marca);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadMarcasInActivas({ commit }) {
    const urlInactivas = `${API_URL}/marcasInactivas`;
    axios
      .get(urlInactivas)
      .then(result => {
        commit("SET_MARCA", result.data.marca);
      })
      .catch(err => {
        console.log(err);
      });
  },
  createMarca({ commit }, value) {
    const urlAdd = `${API_URL}/addMarca`;
    axios
      .post(urlAdd, value)
      .then(result => {
        console.log(result.data.marca);
        commit("SET_MARCA", result.data.marca);
      })
      .catch(err => {
        console.log(err);
      });
  },
  updateMarca({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    const id = value.codigo;
    const urlAdd = `${API_URL}/updateMarca/${id}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_MARCA", result.data.marca);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteMarca({ commit }, value) {
    const urlAdd = `${API_URL}/deleteMarca/${value}`;
    axios
      .put(urlAdd)
      .then(result => {
        console.log(result.data.marca);
        commit("SET_MARCA", result.data.marca);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
