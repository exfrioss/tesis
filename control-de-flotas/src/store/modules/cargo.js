import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
const cargoUrl = `${API_URL}/cargo/cargo`;

export const state = {
  cargos: [],
  validateCargos: "",
  countR: 0,
  usuario: ""
};
export const mutations = {
  SET_CARGO(state, cargos) {
    state.cargos = cargos;
  },
  FIND_CARGO(state, value) {
    state.validateCargo == value;
  },
  CREATE_CARGO(state, cargos) {
    state.cargos.push(cargos);
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  }
};

export const actions = {
  loadCargos({ commit }) {
    axios
      .get(cargoUrl)
      .then(r => r.data.cargo)
      .then(cargos => {
        commit("SET_CARGO", cargos);
      });
  },
  cargosbyId({ state, commit }, validateCargo) {
    commit("FIND_CARGO", validateCargo);
    const r = state.cargos.find(cargos => cargos.codigo === validateCargo);
    if (r) {
      // console.log("Codigo: ", r.codigo);
      commit("INCREMENT_COUNT", r.codigo);
    } else {
      // console.log("Nada de nada");
      commit("INCREMENT_COUNT", 0);
    }
  },
  createCargo({ commit }, cargo) {
    // console.log(region);
    const url = `${API_URL}/cargo/add_cargo/${state.usuario}`;
    axios.post(url, cargo);
    commit("CREATE_CARGO", cargo);
  }
};
export const getters = {
  cargoActivas(state) {
    state.cargos.filter(cargos => cargos.estado == 1);
  },
  cargoInActivas(state) {
    state.cargos.filter(cargos => cargos.estado == 0);
  }
};
