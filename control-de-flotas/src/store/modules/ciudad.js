import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
const ciudadUrl = `${API_URL}/ciudad/ciudad`;
export const state = {
  ciudad: [],
  validateCiudad: "",
  countR: 0,
  usuario: ""
};
export const mutations = {
  SET_CIUDAD(state, ciudad) {
    state.ciudad = ciudad;
  },
  CREATE_CIUDAD(state, ciudad) {
    state.ciudad.push(ciudad);
  },
  FIND_CIUDAD(state, value) {
    state.validateCiudad == value;
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  }
};
export const actions = {
  loadCiudades({ commit }) {
    // console.log("Cargando Datos");
    axios
      .get(ciudadUrl)
      .then(c => c.data.ciudad)
      .then(ciudad => {
        commit("SET_CIUDAD", ciudad);
        // console.log(ciudad);
      });
  },
  loadCiudadOn({ commit }) {
    const urlon = `${API_URL}/ciudad/ciudadOn`;
    axios
      .get(urlon)
      .then(c => c.data.ciudad)
      .then(ciudad => {
        commit("SET_CIUDAD", ciudad);
        // console.log(ciudad);
      });
  },
  createCiudad({ state, commit }, ciudad) {
    console.log("usuario", state.usuario);
    const url = `${API_URL}/ciudad/add_ciudad/${state.usuario}`;
    axios
      .post(url, ciudad)
      .then(result => {
        commit("SET_CIUDAD", result.data.ciudad);
      })
      .catch(err => {
        console.log(err);
      });
  },
  ciudadbyId({ state, commit }, validateCiudad) {
    // console.log(validateCiudad);
    commit("FIND_CIUDAD", validateCiudad);
    const c = state.ciudad.find(ciudad => ciudad.codigo === validateCiudad);
    if (c) {
      // console.log("Codigo: ", c.codigo);
      commit("INCREMENT_COUNT", c.codigo);
    } else {
      // console.log("Nada de nada", c);
      commit("INCREMENT_COUNT", -1);
    }
  },
  updateCiudad({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    const urlAdd = `${API_URL}/ciudad/update_ciudad/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_CIUDAD", result.data.ciudad);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteCiudad({ commit }, value) {
    console.log(value);
    const urlAdd = `${API_URL}/ciudad/delete_ciudad/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log(result.data.ciudad);
        commit("SET_CIUDAD", result.data.ciudad);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
