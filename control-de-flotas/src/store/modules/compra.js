import axios from "axios";
const API_URL = "http://127.0.0.1:3030";
const pedidoUrl = `${API_URL}/pedido`;
// const pedidourl = `${API_URL}/compras/`;

export const state = {
  compra: [],
  cabecera: [],
  listPedido: [],
  compraByID: 0
};
export const mutations = {
  SET_COMPRA(state, value) {
    state.cabecera = value;
  },
  SET_DATA(state, value) {
    state.compra = value;
  },
  SET_COMPRAS(state, value) {
    state.cabecera = value;
  },
  SET_COMPRA_ByID(state, value) {
    state.compraByID = value;
  },
  CREATE_COMPRA(state, value) {
    state.compra.push(value);
  },
  SET_LIST_PEIDO(state, pedidos) {
    state.listPedido = pedidos;
  },
  SET_DATA_FECHA(state, value) {
    state.compra = value;
  }
};

export const actions = {
  guardarCompra({ commit }, pedidobyId) {
    console.log(pedidobyId);
    const urlGuardarCompra = `${API_URL}/insertcompras`;
    axios.post(urlGuardarCompra, pedidobyId);
    commit("CREATE_COMPRA", pedidobyId);
  },
  getCabeceraCompra({ commit }, value) {
    console.log(value);
    commit("SET_COMPRA", value);
  },
  loadComprasPedido({ commit }) {
    axios
      .get(pedidoUrl)
      .then(i => i.data.pedido)
      .then(pedido => {
        // commit("SET_PEDIDO", pedido);
        commit("SET_LIST_PEIDO", pedido);
      });
  },
  loadComprasAnulados({ commit }) {
    const urlAnulados = `${API_URL}/comprasAnuladas`;
    axios
      .get(urlAnulados)
      .then(result => {
        commit("SET_DATA", result.data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadcomprabyId({ state }, idCompra) {
    const url = `${API_URL}/comprasById/${idCompra}`;
    axios
      .get(url)
      .then(result => {
        if (result.data.length > 0) {
          console.log(" Obteniendo data: ", result.data[0].codigo);
          state.compraByID = result.data[0].codigo;
        }
      })
      .catch(err => {
        console.log(err);
      });
  },
  loadCompras({ commit }) {
    const usrCompra = `${API_URL}/compras`;
    axios
      .get(usrCompra)
      .then(result => {
        commit("SET_COMPRAS", result.data);
        commit("SET_DATA", result.data);
      })
      .catch(err => {
        console.log(err);
      });
  },
  anularCompras({ commit }, idfactura) {
    const urlAnular = `${API_URL}/anularfactura/${idfactura}`;
    axios
      .put(urlAnular)
      .then(result => {
        commit("SET_COMPRAS", result.data);
        commit("SET_DATA", result.data);
      })
      .catch(err => {
        console.log("Error: ", err);
      });
  },
  loadComprasByFechas({ commit }, setData) {
    console.log(setData.fechaD, setData.fechaH);
    const urlFecha = `${API_URL}/comprasfechas`;
    axios
      .post(urlFecha, setData)
      .then(result => {
        console.log(result.data);
        commit("SET_DATA_FECHA", result.data);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
