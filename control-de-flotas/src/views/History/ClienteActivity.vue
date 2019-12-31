<template>
  <div>
    <v-container>
      Historial Cliente
      <v-spacer></v-spacer>
      <v-text-field v-model="search" label="Search"></v-text-field>
      <v-data-table
        :headers="headers"
        :items="grafico.customerActivity"
        :search="search"
      >
        <!-- <template v-slot:item[2]=""></template> -->
      </v-data-table>
    </v-container>
    <div>
      <cliente-activity></cliente-activity>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import {mdiKeyboardBackspace} from "@mdi/js";
import ClienteActivity from "../../utils/ClienteActivity"
export default {
  components: {
    'cliente-activity': ClienteActivity,
  },
  data() {
    return {
      search: "",
      headers: [
        { text: "Fecha Pedido", value: "fechaPedido" },
        { text: "Lugar Origen", value: "lugarOrigen" },
        { text: "Fecha Entrega", value: "fechaEntrega" },
        { text: "Lugar Destino", value: "lugarDestino" },
        { text: "Servicio", value: "servicio" },
        { text: "Vehiculo", value: "vehiculo" },
        { text: "Insumo", value: "insumo" },
        { text: "Cantidad Insumo", value: "cantidad" },
        { text: "Costo Insumo", value: "totalInsumo" },
        { text: "Costo Servicio", value: "totalServicio" },
        { text: "Saldo Positivo", value: "saldo" }
      ],
      icons: {
        mdiKeyboardBackspace
      }
    };
  },
  computed: {
    ...mapState(["grafico"])
  },
  mounted () {
    this.grafico.rows = this.grafico.customerActivity.map(cantidad => cantidad.cantidad);
    this.grafico.labels = this.grafico.customerActivity.map(cantidad => cantidad.labels);
  },
};
</script>

<style lang="scss" scoped></style>
