import axios from "axios";
const URL_API = "http://127.0.0.1:3030";

export const state = {
  talonario: []
};
export const actions = {
  insertTalonario({ commit }, value) {
    const insertUrl = `${URL_API}/insertTalonario`;
    axios
      .post(insertUrl, value)
      .then(result => {
        console.log(result.data.talonario);
        commit("SET_LIST_TALONARIO", result.data.talonario);
      })
      .catch(err => {
        console.log(err);
      });
  },
  getTalonariosInactivos({ commit }) {
    const getInactivos = `${URL_API}/getTalonariosInactivos`;
    axios
      .get(getInactivos)
      .then(result => {
        commit("SET_LIST_TALONARIO", result.data.talonario);
      })
      .catch(err => {
        console.log(err);
      });
  },
  getTalonariosActivos({ commit }) {
    const getActivos = `${URL_API}/getTalonariosA`;
    axios
      .get(getActivos)
      .then(result => {
        commit("SET_LIST_TALONARIO", result.data.talonario);
      })
      .catch(err => {
        console.log(err);
      });
  },
  getTheLastTalonarioActivo({ commit }) {
    const lastTalonario = `${URL_API}/getTheLastTalonarioActivo`;
    axios
      .get(lastTalonario)
      .then(result => {
        console.log(result.data);
        commit("SET_LIST_TALONARIO", result.data.talonario[0]);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
export const mutations = {
  SET_LIST_TALONARIO(state, value) {
    state.talonario = value;
  }
};
