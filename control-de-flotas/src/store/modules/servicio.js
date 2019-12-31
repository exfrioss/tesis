import axios from "axios";
const API_URL = "http://127.0.0.1:3030";
const modeloUrl = `${API_URL}/serviciosActivos`;

export const state = {
  servicios: [],
  idServicio: "",
  message: ""
};
export const mutations = {
  SET_SERVICIO(state, value) {
    state.servicios = value;
  },
  SET_MESSAGE(state, value) {
    state.message = value;
  },
  CREATE_SERVICIO(state, value) {
    state.servicios.push(value);
  }
};

export const actions = {
  loadServiciosActivos({ commit }) {
    axios
      .get(modeloUrl)
      .then(result => {
        commit("SET_SERVICIO", result.data.servicio);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadServiciosInActivos({ commit }) {
    const urlInactivas = `${API_URL}/serviciosInactivos`;
    axios
      .get(urlInactivas)
      .then(result => {
        commit("SET_SERVICIO", result.data.servicio);
      })
      .catch(err => {
        console.log(err);
      });
  },
  createServicio({ commit }, value) {
    console.log(value);
    const urlAdd = `${API_URL}/addServicio`;
    axios
      .post(urlAdd, value)
      .then(result => {
        console.log(result.data.servicio);
        commit("SET_SERVICIO", result.data.servicio);
      })
      .catch(err => {
        console.log(err);
      });
  },
  updateServicio({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    const urlAdd = `${API_URL}/updateServicio`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_SERVICIO", result.data.servicio);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteServicio({ commit }, value) {
    const urlAdd = `${API_URL}/deleteServicio/${value}`;
    axios
      .put(urlAdd)
      .then(result => {
        console.log(result.data.modelo);
        commit("SET_SERVICIO", result.data.servicio);
      })
      .catch(err => {
        console.log(err);
      });
  },
  insertarDetalle({ state, commit }, listToPedidoInsumo) {
    console.log("lista: ", listToPedidoInsumo);
    console.log("cod: ", state.idServicio);
    const urlDetalle = `${API_URL}/insertarDetalle/${state.idServicio}`;
    axios
      .post(urlDetalle, listToPedidoInsumo)
      .then(result => {
        console.log("OHAIO wey", result);
        commit("SET_MESSAGE", result.data);
      })
      .catch(err => {
        console.log("SAYONARA wey", err);
        commit("SET_MESSAGE", err);
      });
  }
};
