import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";

export function authenticated(userdata) {
  console.log("Datos recibidos", userdata);
  axios
    .post(`${API_URL}/control`, userdata)
    .then(result => {
      console.log(result.data.token);
      return result.data.token;
    })
    .catch(err => {
      console.log(err);
    });
}
