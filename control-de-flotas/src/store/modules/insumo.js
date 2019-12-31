import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
const insumoUrl = `${API_URL}insumo`;
export const state = {
  insumos: [],
  validateInsumos: "",
  countR: 0
};
export const mutations = {
  SET_INSUMO(state, insumos) {
    state.insumos = insumos;
  },
  CREATE_INSUMO(state, insumos) {
    state.insumos.push(insumos);
  },
  FIND_INSUMO(state, value) {
    state.validateInsumos == value;
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  }
};
export const actions = {
  loadInsumos({ commit }) {
    axios
      .get(insumoUrl)
      .then(i => i.data.insumo)
      .then(insumos => {
        commit("SET_INSUMO", insumos);
      });
  },
  loadInsumosminimo({ commit }) {
    const url = `${API_URL}/insumo/insumominimo`;
    axios
      .get(url)
      .then(i => i.data.insumo)
      .then(insumos => {
        commit("SET_INSUMO", insumos);
      });
  },
  createInsumo({ commit }, insumos) {
    const url = `${API_URL}/insumo/addinsumo`;
    axios.post(url, insumos);
    commit("CREATE_INSUMO", insumos);
  },
  insumobyId({ state, commit }, validateInsumos) {
    commit("FIND_INSUMO", validateInsumos);
    const i = state.insumos.find(insumos => insumos.codigo === validateInsumos);
    if (i) {
      commit("INCREMENT_COUNT", i.codigo);
    } else {
      commit("INCREMENT_COUNT", -1);
    }
  }
};

export const getters = {
  productoById(state, idinsumo) {
    const insumoByiD = state.insumos.find(ins => ins.codigo === idinsumo);
    return {
      descripcion: insumoByiD.descripcion,
      precio: insumoByiD.precio
    };
  }
};
