import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
export const state = {
  descripcion: "",
  cantidad: 0,
  precio: 0,
  subtotal: 0,
  total: 0,
  insumoById: [],
  listToPedidoInsumo: []
};

export const actions = {
  getInsumoServicioByiD({ commit, state }, insumoToPdido) {
    const urlById = `${API_URL}/insumo/findbyid/${insumoToPdido.codigoInsumo}`;
    console.log("realizando busqueda");
    axios
      .get(urlById)
      .then(result => {
        commit("SET_INSUMO_BY_ID", result.data.insumo);
        for (const key in state.insumoById) {
          if (state.insumoById.hasOwnProperty(key)) {
            const element = state.insumoById[key];
            console.log(element);
            const subT =
              parseFloat(insumoToPdido.cantidad) * parseFloat(element.precio);
            var totalS = 0;
            totalS =
              parseFloat(totalS) +
              parseFloat(insumoToPdido.cantidad) * parseFloat(element.precio);
            console.log("Total TodoPedido: ", element.total);
            console.log(totalS);
            commit("SET_CANTIDAD", insumoToPdido.cantidad);
            commit("SET_PRECIO", element.precio);
            commit("SET_DESCRIPTION", element.descripcion);
            commit("SET_SUBTOTAL", subT);
            commit("SET_TOTAL", totalS);
          }
        }
      })
      .catch(err => {
        console.error(err);
      });
  },
  getListToInsumoServicio({ commit }, listToPedidoIndumo, item) {
    var totalS = 0;
    if (item) {
      listToPedidoIndumo.splice(item, 1);
    }
    for (const key in listToPedidoIndumo) {
      if (listToPedidoIndumo.hasOwnProperty(key)) {
        const element = listToPedidoIndumo[key];
        console.log("Esto es Subtotal", element.subtotal);
        totalS = parseFloat(totalS) + parseFloat(element.subtotal);
        console.log("Calculando totals", totalS);
      }
    }
    commit("SET_LIST_TO_INSUMO", listToPedidoIndumo);
    commit("SET_TOTAL", totalS);
    // console.log(listToPedidoIndumo);
  }
};

export const mutations = {
  SET_DESCRIPCION(state, value) {
    state.descripcion = value;
  },
  SET_CANTIDAD(state, value) {
    state.cantidad = value;
  },
  SET_PRECIO(state, value) {
    state.precio = value;
  },
  SET__MONTO(state, value) {
    state.subtotal = value;
  },
  SET_TOTAL(state, value) {
    state.total = value;
  },
  INCREMENTAR_CANTIDAD(state, value) {
    state.cantidad += value;
  },
  SET_INSUMO_BY_ID(state, insumo) {
    state.insumoById = insumo;
    // console.log("SET INSUMOBYID", state.insumoById);
  },
  SET_LIST_TO_INSUMO(state, listToPedidoInsumo) {
    // state.listToPedidoInsumo.push(listToPedidoInsumo);
    state.listToPedidoInsumo = listToPedidoInsumo;
    console.log("SET SET_LIST_TO_INSUMO", state.listToPedidoInsumo);
  }
};
