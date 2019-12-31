import axios from "axios";
const API_URL = "http://127.0.0.1:3030";

export const state = {
  userAcitvity: []
};
export const actions = {
  loadUserActivity({ commit }, value) {
    const url = `${API_URL}/userActivity`;
    axios
      .post(url, value)
      .then(result => {
        commit("SET_USER_ACTIVITY", result.data.userActivity);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
export const mutations = {
  SET_USER_ACTIVITY(state, value) {
    state.userAcitvity = value;
  }
};
