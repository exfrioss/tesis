import axios from "axios";
const API_URL = "http://127.0.0.1:3030";
const modeloUrl = `${API_URL}/segurosActivos`;

export const state = {
  seguros: [],
  idSeguros: ""
};
export const mutations = {
  SET_SEGURO(state, value) {
    state.seguros = value;
  },
  CREATE_SEGURO(state, value) {
    state.seguros.push(value);
  }
};

export const actions = {
  loadSegurosActivos({ commit }) {
    axios
      .get(modeloUrl)
      .then(result => {
        commit("SET_SEGURO", result.data.seguro);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadSegurosInActivos({ commit }) {
    const urlInactivas = `${API_URL}/segurosInactivos`;
    axios
      .get(urlInactivas)
      .then(result => {
        commit("SET_SEGURO", result.data.seguro);
      })
      .catch(err => {
        console.log(err);
      });
  },
  createSeguro({ commit }, value) {
    console.log(value);
    const urlAdd = `${API_URL}/addseguro`;
    axios
      .post(urlAdd, value)
      .then(result => {
        console.log(result.data.modelo);
        commit("SET_SEGURO", result.data.seguro);
      })
      .catch(err => {
        console.log(err);
      });
  },
  updateSeguro({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    // const id = value.codigo;
    const urlAdd = `${API_URL}/updateseguro`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_SEGURO", result.data.seguro);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteSeguro({ commit }, value) {
    const urlAdd = `${API_URL}/deleteseguro/${value}`;
    axios
      .put(urlAdd)
      .then(result => {
        console.log(result.data.modelo);
        commit("SET_SEGURO", result.data.seguro);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
