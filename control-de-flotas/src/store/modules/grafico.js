import axios from "axios";
const URL_API = "http://127.0.0.1:3030";
const activityUrl = `${URL_API}/actividades`;

export const state = {
  usuario: "",
  rows: [],
  labels: [],
  day: 5,
  customerActivity: [],
  fechaD: new Date().toISOString().substr(0, 10),
  fechaH: new Date().toISOString().substr(0, 10),
  anulado: false,
  esconfirmado: true,
  codigoCliente: ""
};
export const mutations = {
  SET_ROWS(state, value) {
    console.log("ROWS: ", value);
    state.rows = value;
  },
  SET_LABELS(state, value) {
    console.log("LABELS: ", value);
    state.labels = value;
  },
  SET_CUSTOMER_ACTIVITY(state, value) {
    state.customerActivity = value;
  }
};
export const actions = {
  loadActivity({ commit, state }) {
    const seturl = `${activityUrl}/${state.day}`;
    axios
      .get(seturl)
      .then(result => {
        console.log("DATA VUEX FOR GRAFICO", result.data[0].rows);
        commit("SET_ROWS", result.data[0].rows);
        commit("SET_LABELS", result.data[1].labels);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadCustomerActivity({ commit, state }, value) {
    const urlCustomerActivity = `${URL_API}/clienteActivity`;
    // var rows = [];
    // var labels= [];
    axios
      .post(urlCustomerActivity, value)
      .then(result => {
        console.log(
          "Obteniendo Historial:",
          result.data.activity.map(cantidad => cantidad.cantidad)
        );
        commit("SET_CUSTOMER_ACTIVITY", result.data.activity);
        state.rows = result.data.activity.map(cantidad => cantidad.cantidad);
        state.labels = result.data.activity.map(cantidad => cantidad.insumo);
      })
      .catch(err => {
        console.log(err);
      });
    // commit("SET_ROWS", rows);
    //     commit("SET_LABELS", labels);
  },
  loadCustomerActivityAnulados({ commit }, value) {
    const urlCustomerActivity = `${URL_API}/clienteActivity`;
    axios
      .post(urlCustomerActivity, value)
      .then(result => {
        console.log("Obteniendo Historial:", result.data.activity);
        commit("SET_CUSTOMER_ACTIVITY", result.data.activity);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
