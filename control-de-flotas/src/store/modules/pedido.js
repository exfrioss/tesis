import axios from "axios";
// import insumo from "../../APIService";
const API_URL = "http://127.0.0.1:3030/";
const pedidoUrl = `${API_URL}/pedido/pedido`;
export const state = {
  pedido: [],
  detallepedido: [],
  pedidoById: [],
  idPedido: "",
  idp: "",
  mensaje: "",
  countR: 0
};

export const mutations = {
  SET_PEDIDO(state, pedidos) {
    state.pedido = pedidos;
  },
  MENSAJE_ERROR(state, value) {
    state.mensaje = value;
  },
  CREATE_PEDIDO(state, pedidos) {
    state.pedido.push(pedidos);
  },
  SET_PEDIDO_BY_ID(state, idPedido) {
    state.idPedido = idPedido;
  },
  SET_ID_PEDIDO(state, pedidoById) {
    state.pedidoById = pedidoById;
  },
  SET_ID(state, value) {
    state.idp = value;
  },
  PUSH_INSUMO_TO_PEDIDO(state, detalles) {
    state.detallepedido = detalles;
  },
  CREATE_DETALLE_PEDIDO(state, detalles) {
    state.detallepedido.push(detalles);
  },
  INCREMENT_COUNT(state, value) {
    state.countR = value;
  },
  INCREMENT_CANTIDAD(state, value) {
    state.detallepedido.cantidad += value;
  },
  DECREMENT_CANTIDAD(state, value) {
    state.detallepedido -= value;
  }
};
export const actions = {
  loadPedido({ commit }) {
    axios
      .get(pedidoUrl)
      .then(i => i.data.pedido)
      .then(pedido => {
        commit("SET_PEDIDO", pedido);
      });
  },
  loadPedidosAnulados({ commit }) {
    const urlAnulados = `${API_URL}/pedido/pedidosAnulados`;
    axios
      .get(urlAnulados)
      .then(i => i.data.pedido)
      .then(pedido => {
        commit("SET_PEDIDO", pedido);
      });
  },

  loadPedidosComprados({ commit }) {
    console.log("pedidos comprados");
    const urlcomprados = `${API_URL}/pedido/pedidosComprados`;
    axios
      .get(urlcomprados)
      .then(i => i.data.pedido)
      .then(pedido => {
        commit("SET_PEDIDO", pedido);
      });
  },

  createPedido({ commit }, pedido) {
    // commit("CREATE_PEDIDO", pedido);
    console.log("Agregando Pedidos:", pedido);
    const url = `${API_URL}/pedido/addpedidos`;
    axios
      .post(url, pedido)
      .then(result => {
        commit("SET_PEDIDO", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
        commit("MENSAJE_ERROR", err);
      });
  },
  createDetallePedido({ commit, rootState }) {
    console.log(rootState.todopedido.listToPedidoInsumo);
    for (const key in rootState.todopedido.listToPedidoInsumo) {
      if (rootState.todopedido.listToPedidoInsumo.hasOwnProperty(key)) {
        const element = rootState.todopedido.listToPedidoInsumo[key];
        console.log("Create Pedido: ", element.codigoPedido);
        const urls = `${API_URL}/pedido/addetallepedidos`;
        axios
          .post(urls, element)
          .then(result => {
            commit("SET_PEDIDO", result.data.pedido);
          })
          .catch(err => {
            console.log(err);
            commit("MENSAJE_ERROR", err);
          });
      }
    }
  },
  pedidobyId({ commit }, idPedido) {
    const urlByid = `${API_URL}/pedido/getPedidoByid/${idPedido}`;
    axios
      .get(urlByid)
      .then(result => {
        console.log("Datos obtenido: ", result.data.pedido);
        commit("SET_ID_PEDIDO", result.data.pedido);
      })
      .catch(err => {
        console.error("Há ocurrido un error al obtener los datos: ", err);
      });
  },
  anularPedido({ commit }, value) {
    console.log(value);
    const anularUrl = `${API_URL}/pedido/anularPedido`;
    axios
      .put(anularUrl, value)
      .then(result => {
        commit("SET_PEDIDO", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
      });
    commit("SET_ID", value.codigo);
  }
};
