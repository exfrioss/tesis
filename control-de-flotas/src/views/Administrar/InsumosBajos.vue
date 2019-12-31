<template>
    <v-container>
      <v-card-title>
      Insumos faltantes 
      <v-spacer></v-spacer>
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
      :items="insumo.insumos"
      :search="search"
    ></v-data-table>
  </v-container>
</template>

<script>
import { mapState } from "vuex"
export default {
  data() {
    return {
      search: "",
      headers: [
        { text: "Código", value: "codigo" },
        { text: "Descripción", value: "descripcion" },
        { text: "Precio", value: "precio" },
        { text: "Iva", value: "iva" },
        { text: "Stock minimo", value: "stock_minimo" },
        { text: "Stock actual", value: "stock_actual" },
        { text: "Stock ideal", value: "stock_ideal" }
      ]
    };
  },
  mounted() {
    this.$store.dispatch("loadInsumosminimo");
  },
  computed: {
    ...mapState(["insumo"])
  },
};
</script>

<style lang="scss" scoped></style>
