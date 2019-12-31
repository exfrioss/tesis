import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
const departamentoUrl = `${API_URL}/departamento/departamento`;
export const state = {
  departamentos: [],
  validateDepa: "",
  countR: 0,
  usuario: ""
};
export const mutations = {
  SET_DEPARTAMENTOS(state, departamentos) {
    state.departamentos = departamentos;
  },
  CREATE_DEPARTAMENTO(state, departamento) {
    state.departamentos.push(departamento);
  },
  FIND_DEPARTAMENTO(state, value) {
    state.validateDepa == value;
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  }
};

export const actions = {
  loadDepartamentos({ commit }) {
    axios
      .get(departamentoUrl)
      .then(d => d.data.departamento)
      .then(departamentos => {
        commit("SET_DEPARTAMENTOS", departamentos);
      });
  },
  loadDepartamentosActivos({ commit }) {
    const urlActivos = `${API_URL}/departamento/departamentosActivos`;
    axios
      .get(urlActivos)
      .then(d => d.data.departamento)
      .then(departamentos => {
        commit("SET_DEPARTAMENTOS", departamentos);
      });
  },
  loadDepartamentosInActivos({ commit }) {
    const urlInActivos = `${API_URL}/departamento/departamento_off`;
    axios
      .get(urlInActivos)
      .then(d => d.data.departamento)
      .then(departamentos => {
        commit("SET_DEPARTAMENTOS", departamentos);
      });
  },
  createDepartamento({ commit }, departamento) {
    const url = `${API_URL}/departamento/add_departamento/${state.usuario}`;
    axios
      .post(url, departamento)
      .then(result => {
        commit("SET_DEPARTAMENTOS", result.data.departamento);
      })
      .catch(err => {
        console.log(err);
      });
    // commit("CREATE_DEPARTAMENTO", departamento);
  },
  departamentobyId({ state, commit }, validateDepa) {
    commit("FIND_DEPARTAMENTO", validateDepa);
    const d = state.departamentos.find(
      departamentos => departamentos.codigo === validateDepa
    );
    if (d) {
      // console.log("Codigo: ", d.codigo);
      commit("INCREMENT_COUNT", d.codigo);
    } else {
      // console.log("Nada de nada", d);
      commit("INCREMENT_COUNT", -1);
    }
  },
  updateDepartamento({ commit }, value) {
    console.log("Lo estamos intentando: ", value);
    const urlAdd = `${API_URL}/departamento/update_departamento/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log("Datos actualizados");
        commit("SET_DEPARTAMENTOS", result.data.departamento);
      })
      .catch(err => {
        console.log(err);
      });
  },
  deleteDepartamento({ commit }, value) {
    const urlAdd = `${API_URL}/departamento/delete_departamento/${state.usuario}`;
    axios
      .put(urlAdd, value)
      .then(result => {
        console.log(result.data.departamento);
        commit("SET_DEPARTAMENTOS", result.data.departamento);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
