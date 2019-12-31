import axios from "axios";
const URL_API = "http://127.0.0.1:3030";

export const state = {
  fechaP: "",
  fechaE: "",
  servicio: [],
  pesoI: 15000,
  pesoF: 15000,
  total: 0,
  rango: 0,
  cliente: [],
  message: "",
  pedidosPendientesByCliente: [],
  usuario: "",
  show: false,
  pedidosConfirmados: [],
  codcliente: "",
  chofer: [],
  cabecera: [],
  detalle: [],
  codPedido: ""
};
export const actions = {
  getServicios({ commit }, item) {
    console.log(item);
    commit("SET_SERVICIO", item);
    // commit("SET_FECHAP", fechaP);
    // commit("SET_FECHAE", fechaE);
    // commit("SET_PESOI", pesoI);
    // commit("SET_PESOF", pesoF);
    var total = parseFloat(state.pesoI) * parseFloat(item.precio);
    console.log(total, item.precio);
    commit("SET_TOTAL", total);
    // commit("SET_RANGO", rango);
  },
  calcularTotal({ commit }, total) {
    commit("SET_TOTAL", total);
  },
  insertPedidoCliente({ commit }, value) {
    console.log(value.fechaP);
    const urlInsert = `${URL_API}/insertPedidoCliente`;
    axios
      .post(urlInsert, value)
      .then(result => {
        console.log(result.data.pedido);
        commit("SET_PEDIDOS_PENDIENTES_BY_CLIENTE", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
      });
  },
  confirmarPedidosCliente({ commit }, value) {
    const urlInsert = `${URL_API}/confirmarPedidos/${state.usuario}`;
    axios
      .post(urlInsert, value)
      .then(result => {
        console.log(result.data.pedido);
        commit("SET_PEDIDOS_PENDIENTES_BY_CLIENTE", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
      });
  },
  anularPedidoCliente({ commit }, value) {
    const urlAnular = `${URL_API}/anularPedidosclientes`;
    axios
      .post(urlAnular, value)
      .then(result => {
        console.log(result.data.pedido);
        commit("SET_PEDIDOS_PENDIENTES_BY_CLIENTE", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadPedidosPendienteByCliente({ commit }) {
    console.log("Value PPC", state.cliente);
    const urlPCP = `${URL_API}/pedidosclientespendientes/${state.cliente.codCliente}`;
    axios
      .get(urlPCP)
      .then(result => {
        commit("SET_PEDIDOS_PENDIENTES_BY_CLIENTE", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadPedidosConfirmados({ commit }) {
    const getPedidos = `${URL_API}/pedidosClientesConfirmados`;
    axios
      .get(getPedidos)
      .then(result => {
        commit("SET_PEDIDOS_CONFIRMADOS", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadListaAFacturar({ commit }, value) {
    const getPedidos = `${URL_API}/pedidobyid/${value}`;
    axios
      .get(getPedidos)
      .then(result => {
        commit("SET_CABECERA_FACTURAR", result.data[0].pedido[0]);
        commit("SET_DETALLE_FACTURA", result.data[1].detalle);
      })
      .catch(err => {
        console.log(err);
      });
  },
  anularPedidosConfirmados({ commit }, value) {
    const setAnuluarPedidos = `${URL_API}/anularPedidosConfirmados`;
    axios
      .put(setAnuluarPedidos, value)
      .then(result => {
        commit("SET_PEDIDOS_CONFIRMADOS", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
      });
  },
  pedidosClientesConfirmadosById({ commit, state }, value) {
    const url = `${URL_API}/pedidosClientesConfirmadosById/${value}`;
    axios
      .get(url)
      .then(result => {
        commit("SET_COD_CLIENTE", value);
        commit("SET_PEDIDOS_CONFIRMADOS", result.data.pedido);
      })
      .catch(err => {
        console.log(err);
      });
  },
  chofer({ commit }) {
    const url = `${URL_API}/chofer`;
    axios
      .get(url)
      .then(result => {
        commit("SET_CHOFER", result.data.personal);
      })
      .catch(err => {
        console.log(err);
      });
  },
  addChofer({ commit }, value) {
    const urladdChofer = `${URL_API}/addChofer`;
    axios
      .put(urladdChofer, value)
      .then(result => {
        console.log(result.data.message)
        commit("SET_MESSAGE", result.data.message);
      })
      .catch(err => {
        console.log(err);
      });
  }
};

export const mutations = {
  SET_CABECERA_FACTURAR(state, value) {
    console.log("Cabecera: ", value);
    state.cabecera = value;
  },
  SET_DETALLE_FACTURA(state, value) {
    console.log("DETALLE: ", value);
    state.detalle = value;
  },
  SET_CHOFER(state, value) {
    state.chofer = value;
  },
  SET_SERVICIO(state, value) {
    state.servicio = value;
  },
  SET_FECHAP(state, value) {
    state.fechaP = value;
  },
  SET_FECHAE(state, value) {
    state.fechaE = value;
  },
  SET_PESOI(state, value) {
    state.pesoI = value;
  },
  SET_PESOF(state, value) {
    state.pesoF = value;
  },
  SET_TOTAL(state, value) {
    state.total = value;
  },
  SET_RANGO(state, value) {
    state.rango = value;
  },
  SET_MESSAGE(state, value) {
    state.message = value;
  },
  SET_PEDIDOS_PENDIENTES_BY_CLIENTE(state, value) {
    state.pedidosPendientesByCliente = value;
  },
  SET_PEDIDOS_CONFIRMADOS(state, value) {
    state.pedidosConfirmados = value;
  },
  SET_COD_CLIENTE(state, value) {
    state.codcliente = value;
  }
};
