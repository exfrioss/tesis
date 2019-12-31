import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
const personalUrl = `${API_URL}/personal/personal`;
export const state = {
  personal: [],
  validarPersonal: "",
  per: "",
  countR: 0,
  message: "",
  objetoPersonal: [],
  btnOn: true,
  usuario: "",
  etiqueta: "Guardar"
};
export const mutations = {
  SET_PERSONAL(state, personal) {
    state.personal = personal;
  },
  SET_OBJETO_PERSONAL(state, value) {
    state.objetoPersonal = [];
    state.objetoPersonal = value;
  },
  SET_BTN_ON(state, value) {
    state.btnOn = value;
  },
  SET_MESSAGE(state, message) {
    state.message = message;
  },
  CREATE_PERSONAL(state, personal) {
    state.personal.push(personal);
  },
  FIND_PERSONAL(state, value) {
    state.validarPersonal = value;
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  }
};
export const actions = {
  loadPersonal({ commit }) {
    axios
      .get(personalUrl)
      .then(p => p.data.personal)
      .then(personal => {
        commit("SET_PERSONAL", personal);
      });
  },
  loadPersonalOn({ commit }) {
    const urlOn = `${API_URL}/personal/personalOn`;
    axios
      .get(urlOn)
      .then(p => p.data.personal)
      .then(personal => {
        commit("SET_PERSONAL", personal);
      });
  },

  loadPersonaloff({ commit }) {
    const urlOff = `${API_URL}/personal/personalOff`;
    axios
      .get(urlOff)
      .then(p => p.data.personal)
      .then(personal => {
        commit("SET_PERSONAL", personal);
      });
  },

  loadPersonalbyID({ commit }, value) {
    console.log(value);
    const API_Personal = "http://127.0.0.1:3030";
    const url = `${API_Personal}/personalbyid/${value}`;
    axios
      .get(url)
      .then(result => {
        commit("SET_PERSONAL", result.data.personal);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadUsuarioSistema({ commit }) {
    const urlUsuario = `${API_URL}usuarioSistema`;
    axios
      .get(urlUsuario)
      .then(result => {
        commit("SET_PERSONAL", result.data.personal);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadPersonalbyemail({ commit }, value) {
    console.log("Desde personal by email: ", value);
    const API_Personal = "http://127.0.0.1:3030";
    const url = `${API_Personal}/personalbyemail/${value}`;
    axios
      .get(url)
      .then(result => {
        commit("SET_PERSONAL", result.data.personal);
      })
      .catch(err => {
        console.log(err);
      });
  },
  createPersonal({ commit }, value) {
    const url = `${API_URL}/personal/add_employee/${state.usuario}`;
    axios
      .post(url, value)
      .then(result => {
        commit("SET_PERSONAL", result.data.personal);
      })
      .catch(err => {
        console.log(err);
      });
  },
  personalbyId({ state, commit }, validarPersonal) {
    commit("FIND_PERSONAL", validarPersonal);
    const p = state.personal.find(
      personal => personal.codigo === validarPersonal
    );
    if (p) {
      commit("INCREMENT_COUNT", p.codigo);
    } else {
      commit("INCREMENT_COUNT", 0);
    }
  },
  setmessage({ commit }, message) {
    commit("SET_MESSAGE", message);
  },
  updatePersonal({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    const urlAdd = `${API_URL}update_employee/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_PERSONAL", result.data.personal);
      })
      .catch(err => {
        console.log(err);
      });
  },
  getPersonal({ commit }, value) {
    console.log("Adquiriendo datos: ", value);
    commit("SET_OBJETO_PERSONAL", value);
  },
  getBTN({ commit }, value) {
    console.log("Adquiriendo datos: ", value);
    commit("SET_BTN_ON", value);
  },
  deletePersonal({ commit }, value) {
    const urlAdd = `${API_URL}delete_employee/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log(result.data.personal);
        commit("SET_PERSONAL", result.data.personal);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
export const getters = {
  perosnalByID: state => value => {
    console.log(value);
    return state.personal.filter(personal => personal.codigo == value);
  }
};
