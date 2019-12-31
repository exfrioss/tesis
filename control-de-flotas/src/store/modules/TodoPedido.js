import axios from "axios";
const API_URL = "http://127.0.0.1:3030/";
// const insumoUrl = `${API_URL}/insumo/insumo`;

export const state = {
  descripcion: "",
  cantidad: 0,
  precio: 0,
  subtotal: 0,
  total: 0,
  insumoById: [],
  listToPedidoInsumo: []
};
export const mutations = {
  SET_CANTIDAD(state, value) {
    state.cantidad = value;
    // console.log("Set Cantidad", value);
  },
  SET_PRECIO(state, precio) {
    state.precio = precio;
    // console.log("SET precio", precio);
  },
  SET_DESCRIPTION(state, descripcion) {
    // console.log(descripcion);
    state.descripcion = descripcion;
    // console.log("SET Descripcion", descripcion);
  },
  SET_SUBTOTAL(state, subT) {
    state.subtotal = subT;
    // console.log("SET Subtotal", precio, cantidad);
  },
  SET_TOTAL(state, total) {
    state.total = total;
    console.log("SET TOTAL", total);
  },
  INCREMENT_CANTIDAD(state, cantidad) {
    state.cantidad += cantidad;
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
export const actions = {
  getInsumoByiD({ commit, state }, insumoToPdido) {
    // console.log(insumoToPdido.idProducto, insumoToPdido.cantidad);
    const urlById = `${API_URL}/insumo/findbyid/${insumoToPdido.idProducto}`;
    axios
      .get(urlById)
      .then(result => {
        // state.insumoById = result.data.insumo;
        commit("SET_INSUMO_BY_ID", result.data.insumo);
        for (const key in state.insumoById) {
          if (state.insumoById.hasOwnProperty(key)) {
            const element = state.insumoById[key];
            const subT =
              parseFloat(insumoToPdido.cantidad) * parseFloat(element.precio);
            var totalS = 0;
            totalS =
              parseFloat(totalS) +
              parseFloat(insumoToPdido.cantidad) * parseFloat(element.precio);
            console.log("Total TodoPedido: ", element.total);
            console.log(element.total);
            commit("SET_CANTIDAD", insumoToPdido.cantidad);
            commit("SET_PRECIO", element.precio);
            commit("SET_DESCRIPTION", element.descripcion);
            commit("SET_SUBTOTAL", subT);
          }
        }
      })
      .catch(err => {
        console.error(err);
      });
    // console.log(state.insumoById);
  },
  getListToInsumo({ commit }, listToPedidoIndumo, item) {
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
