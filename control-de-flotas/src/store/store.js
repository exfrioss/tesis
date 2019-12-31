import Vue from "vue";
import Vuex from "vuex";
import * as region from "@/store/modules/region.js";
import * as departamento from "@/store/modules/departamento.js";
import * as ciudad from "@/store/modules/ciudad.js";
import * as cliente from "@/store/modules/cliente.js";
import * as personal from "@/store/modules/personal.js";
import * as proveedor from "@/store/modules/proveedor.js";
import * as cargo from "@/store/modules/cargo.js";
import * as insumo from "@/store/modules/insumo.js";
import * as pedido from "@/store/modules/pedido.js";
import * as todopedido from "@/store/modules/TodoPedido.js";
import * as compras from "@/store/modules/compra.js";
import * as marca from "@/store/modules/marca.js";
import * as modelo from "@/store/modules/modelo.js";
import * as seguro from "@/store/modules/seguro.js";
import * as tipo from "@/store/modules/tipo.js";
import * as vehiculo from "@/store/modules/vehiculo.js";
import * as servicio from "@/store/modules/servicio.js";
import * as login from "@/store/modules/login.js";
import * as todoInsumo from "@/store/modules/todoInsumo.js";
import * as pedidoCliente from "@/store/modules/PedidoCliente.js";
import * as grafico from "@/store/modules/grafico.js";
import * as linechart from "../utils/UserActivityChart.js";
import * as ajusteFactura from "@/store/modules/ajusteFactura.js";
import * as facturaCliente from "@/store/modules/facturaCliente.js";
import * as userActivity from "@/store/modules/userActivity.js";
import * as ClienteActivity from "../utils/ClienteActivity.js";

Vue.use(Vuex);
export default new Vuex.Store({
  modules: {
    region,
    departamento,
    ciudad,
    cliente,
    personal,
    proveedor,
    cargo,
    insumo,
    pedido,
    todopedido,
    compras,
    marca,
    modelo,
    seguro,
    tipo,
    vehiculo,
    servicio,
    login,
    todoInsumo,
    pedidoCliente,
    grafico,
    linechart,
    ajusteFactura,
    facturaCliente,
    userActivity,
    ClienteActivity
  },
  //definir los almacenadores de datos
  state: {},
  //Realizar llamadas a las apis
  mutations: {},
  //manipular las mutaciones
  actions: {},
  //realizamos llamadas
  getters: {}
});
