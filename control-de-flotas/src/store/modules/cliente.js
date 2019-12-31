import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
const clienteUrl = `${API_URL}/cliente/cliente`;
export const state = {
  clientes: [],
  validarCliente: "",
  countR: 0,
  usuario: ""
};
export const mutations = {
  SET_CLIENTE(state, clientes) {
    state.clientes = clientes;
  },
  CREATE_CLIENTES(state, clientes) {
    state.clientes.push(clientes);
  },
  FIND_CLIENTES(state, value) {
    state.validarCliente = value;
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  }
};
export const actions = {
  loadClientes({ commit }) {
    axios
      .get(clienteUrl)
      .then(cl => cl.data.cliente)
      .then(clientes => {
        commit("SET_CLIENTE", clientes);
      });
  },
  loadClienteON({ commit }) {
    const urlOn = `${API_URL}/cliente/clienteOn`;
    axios
      .get(urlOn)
      .then(cl => cl.data.cliente)
      .then(clientes => {
        commit("SET_CLIENTE", clientes);
      });
  },
  loadClienteOFF({ commit }) {
    const urlOn = `${API_URL}/cliente/clienteOff`;
    axios
      .get(urlOn)
      .then(cl => cl.data.cliente)
      .then(clientes => {
        commit("SET_CLIENTE", clientes);
      });
  },
  createCliente({ commit }, clientes) {
    const url = `${API_URL}/cliente/add_cliente/${state.usuario}`;
    axios
      .post(url, clientes)
      .then(result => {
        commit("SET_CLIENTE", result.data.cliente);
      })
      .catch(err => {
        console.log(err);
      });
  },
  clientebyId({ state, commit }, validarCliente) {
    commit("FIND_CLIENTES", validarCliente);
    const cl = state.clientes.find(
      clientes => clientes.codigo === validarCliente
    );
    if (cl) {
      commit("INCREMENT_COUNT", cl.codigo);
    } else {
      commit("INCREMENT_COUNT", 0);
    }
  },
  updateCliente({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    const urlAdd = `${API_URL}/cliente/update_cliente/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_CLIENTE", result.data.cliente);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteCliente({ commit }, value) {
    const urlAdd = `${API_URL}/cliente/delete_cliente/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log(result.data.cliente);
        commit("SET_CLIENTE", result.data.cliente);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
