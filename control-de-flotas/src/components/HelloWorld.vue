<template>
  <div>
    <v-container>
      <v-row>
        <v-col cols="12" sm="4">
          <anulados-chart></anulados-chart>
        </v-col>
        <v-col cols="12" sm="4">
          <p v-show="false">
            {{ (this.linechart.usuario = this.$store.getters.UserLogueado) }}
          </p>
          <line-chart></line-chart>
        </v-col>
        <v-col cols="12" sm="4">
          <pedido-producto></pedido-producto>
        </v-col>
      </v-row>
    </v-container>
    <v-container>
      <v-row>
        <v-col cols="12" sm="6">
          <table-pedido></table-pedido>
        </v-col>
        <v-col cols="12" sm="6">
          <insumos-minimos></insumos-minimos>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import { mapState } from "vuex";
import LineChart from "../utils/UserActivityChart";
import pedidosChar from "../utils/PedidosAnuladosActivoty";
import activityProductos from "../utils/ActivityProductoPedido.js";
import ListaPedidosPendientesAnulados from "../views/Pedidos/ListaPedidosPendientesAnulados";
import insumosBajos from "../views/Administrar/InsumosBajos"
export default {
  components: {
    "line-chart": LineChart,
    "anulados-chart": pedidosChar,
    "pedido-producto": activityProductos,
    "table-pedido": ListaPedidosPendientesAnulados,
    "insumos-minimos": insumosBajos
  },
  mounted() {},
  computed: {
    ...mapState(["linechart"])
  }
};
</script>

<style lang="scss" scoped></style>
