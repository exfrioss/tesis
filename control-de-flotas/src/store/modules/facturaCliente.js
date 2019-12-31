import axios from "axios";
const URL_API = "http://127.0.0.1:3030";

export const state = {
  btnState: false
};
export const actions = {
  guardarFactura({ commit }, value) {
    console.log(value);
    const url = `${URL_API}/guardarfactura`;
    axios
      .post(url, value)
      .then(result => {
        console.log(result.data);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
export const mutations = {};
