import axios from "axios";
const API_URL = "http://127.0.0.1:3030";
const vehiculoUrl = `${API_URL}/vehiculosActivos`;

export const state = {
  vehiculos: [],
  idVehiculo: ""
};
export const mutations = {
  SET_DATA(state, value) {
    state.vehiculos = value;
  },
  CREATE_DATA(state, value) {
    state.vehiculos.push(value);
  }
};

export const actions = {
  loadVehiculosActivos({ commit }) {
    axios
      .get(vehiculoUrl)
      .then(result => {
        commit("SET_DATA", result.data.vehiculo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadVehiculosInActivos({ commit }) {
    const urlInactivas = `${API_URL}/vehiculosInactivos`;
    axios
      .get(urlInactivas)
      .then(result => {
        commit("SET_DATA", result.data.vehiculo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  createVehiculo({ commit }, value) {
    console.log(value);
    const urlAdd = `${API_URL}/addvehiculo`;
    axios
      .post(urlAdd, value)
      .then(result => {
        console.log(result.data.vehiculo);
        commit("SET_DATA", result.data.vehiculo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  updateVehiculo({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    // const id = value.codigo;
    const urlAdd = `${API_URL}/updatevehiculo`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_DATA", result.data.vehiculo);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteVehiculo({ commit }, value) {
    console.log("eliminando" + value);
    const urlAdd = `${API_URL}/deletevehiculo/${value}`;
    axios
      .put(urlAdd)
      .then(result => {
        console.log(result.data.vehiculo);
        commit("SET_DATA", result.data.vehiculo);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
