import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
import { isValidJwt, EventBus } from "../../utils/index.js";

export const state = {
  userData: [],
  jwt: ""
};
export const actions = {
  login({ commit }, userData) {
    commit("SET_USER_DATA", userData);
    axios
      .post(`${API_URL}control`, userData)
      .then(result => {
        console.log(result.data.token);
        commit("SET_JWT_TOKEN", { jwt: result.data });
      })
      .catch(err => {
        console.log("Error the autentication", err);
        EventBus.$emit("failedAuthentication", err);
      });
  }
};
export const mutations = {
  SET_USER_DATA(state, value) {
    console.log("USER_DATA value: ", value);
    state.userData = value;
  },
  SET_JWT_TOKEN(state, value) {
    console.log("SET_JWT_TOKEN value: ", value);
    localStorage.token = value.jwt.token;
    state.jwt = value.jwt;
  }
};

export const getters = {
  isAuthenticated(state) {
    return isValidJwt(state.jwt.token);
  },
  UserLogueado(state) {
    return state.userData.email;
  }
};
