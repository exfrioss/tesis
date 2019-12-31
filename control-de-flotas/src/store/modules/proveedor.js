import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
const proveedorURL = `${API_URL}/proveedor/proveedor`;
export const state = {
  proveedor: [],
  proveedorById: [],
  validarProveedor: "",
  countR: 0,
  usuario: ""
};
export const mutations = {
  SET_PROVEEDOR(state, proveedor) {
    state.proveedor = proveedor;
  },
  CREATE_PROVEEDOR(state, proveedor) {
    state.proveedor.push(proveedor);
  },
  FIND_PROVEEDOR(state, value) {
    state.validarProveedor = value;
  },
  PROVEEDOR_BY_ID(state, value) {
    state.proveedorById = value;
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  }
};
export const actions = {
  loadProveedor({ commit }) {
    axios
      .get(proveedorURL)
      .then(p => p.data.proveedor)
      .then(proveedor => {
        commit("SET_PROVEEDOR", proveedor);
      });
  },
  createProveedor({ commit }, proveedor) {
    const url = `${API_URL}/proveedor/add_proveedor/${state.usuario}`;
    axios.post(url, proveedor);
    commit("CREATE_PROVEEDOR", proveedor);
  },
  personalbyId({ state, commit }, validarProveedor) {
    commit("FIND_PROVEEDOR", validarProveedor);
    const p = state.proveedor.find(
      proveedor => proveedor.codigo === validarProveedor
    );
    if (p) {
      commit("INCREMENT_COUNT", p.codigo);
    } else {
      commit("INCREMENT_COUNT", 0);
    }
  },
  getProveedorPorId({ commit }, idproveedor) {
    console.log(idproveedor);
    const urlById = `${API_URL}/pedido/proveedorbyId/${idproveedor}`;
    axios
      .get(urlById)
      .then(result => {
        commit("PROVEEDOR_BY_ID", result.data.proveedor);
        console.log(result.data.proveedor);
      })
      .catch(err => {
        console.log("Error al ontener datos", err);
      });
  }
};
