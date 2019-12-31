import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
const regionUrl = `${API_URL}/region/region`;

export const state = {
  regiones: [],
  validatoRegion: "",
  countR: 0,
  usuario: ""
};
export const mutations = {
  SET_REGION(state, regiones) {
    state.regiones = regiones;
  },
  FIND_REGION(state, value) {
    state.validatoRegion == value;
  },
  CREATE_REGION(state, region) {
    state.regiones.push(region);
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  }
};

export const actions = {
  loadRegiones({ commit }) {
    axios
      .get(regionUrl)
      .then(r => r.data.region)
      .then(regiones => {
        commit("SET_REGION", regiones);
      });
  },
  regionbyId({ state, commit }, validatoRegion) {
    commit("FIND_REGION", validatoRegion);
    const r = state.regiones.find(
      regiones => regiones.codigo === validatoRegion
    );
    if (r) {
      console.log("Codigo: ", r.codigo);
      commit("INCREMENT_COUNT", r.codigo);
    } else {
      console.log("Nada de nada");
      commit("INCREMENT_COUNT", 0);
    }
  },
  createRegion({ commit }, region) {
    const url = `${API_URL}/region/add_region/${state.usuario}`;
    axios
      .post(url, region)
      .then(result => {
        commit("SET_REGION", result.data.region);
      })
      .catch(err => {
        console.log(err);
      });
    // commit("CREATE_REGION", region);
  },
  updateRegion({ commit }, value) {
    console.log("Lo estamos intentando: ", value.codigo);
    const urlAdd = `${API_URL}/region/update_region/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_REGION", result.data.region);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteRegion({ commit }, value) {
    const urlAdd = `${API_URL}/region/deleteregion/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log(result.data.region);
        commit("SET_REGION", result.data.region);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
export const getters = {
  regionesActivas(state) {
    state.regiones.filter(regiones => regiones.estado == 1);
  },
  regionesInActivas(state) {
    state.regiones.filter(regiones => regiones.estado == 0);
  }
};
