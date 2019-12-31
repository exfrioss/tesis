<template>
  <v-container>
    <v-card-title>
      Pedidos Proveedor P&nbsp&nbsp&nbsp&nbsp
      <v-checkbox
        v-model="checkbox1"
        @change="onCheckboxChange"
        label="Anulados:"
      ></v-checkbox>
      &nbsp&nbsp
      <v-checkbox
        v-model="checkbox2"
        @change="onCheckboxChange1"
        label="Recibidos:"
      ></v-checkbox>
      <v-spacer></v-spacer>
      <v-text-field
        autofocus
        v-model="search"
        label="Buscar"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="pedido.pedido"
      :loading="loading"
      :search="search"
    ></v-data-table>
  </v-container>
</template>

<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      checkbox1: false,
      checkbox2: false,
      loading: true,
      search: "",
      headers: [
        { text: "Código Pedido", value: "codigo" },
        { text: "Proveedor", value: "proveedor" },
        { text: "Total a Pagar", value: "total" },
        { text: "Encargado", value: "idproveedor" },
        { text: "Fecha Pedido", value: "fechaP" }
      ]
    };
  },
  mounted() {
    this.$store
      .dispatch("loadPedido")
      .then(() => {
        this.loading = false;
      })
      .catch(err => {});
  },
  computed: {
    ...mapState(["pedido"])
  },
  methods: {
    onCheckboxChange(newValue, oldValue) {
      this.checkbox2 = false;
      console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.$store.dispatch("loadPedidosAnulados");
      } else {
        this.$store.dispatch("loadPedido");
      }
    },
    onCheckboxChange1(newValue, oldValue) {
      this.checkbox1 = false;
      console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.$store.dispatch("loadPedidosComprados");
      } else {
        this.$store.dispatch("loadPedido");
      }
    }
  }
};
</script>

<style lang="scss" scoped></style>
