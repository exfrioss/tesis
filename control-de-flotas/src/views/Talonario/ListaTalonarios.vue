<template>
  <div>
    <v-card-title>
      Talonarios
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="this.ajusteFactura.talonario"
      :search="search"
    ></v-data-table>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      search: "",
      headers: [
          {text:"Nro Talonario", value:"timbrado"},
          {text: "Nro Establecimiento", value:"establecimiento"},
          {text: "Estado", value:"estado"},
          {text: "Fecha vigencia Inicio", value:"fechaInicioVigencia"},
          {text: "Fecha vigencia fin", value:"fechaFinVigencia"},
          {text: "Nro Inicial", value:"nroInicio"},
          {text: "Nro Actual", value:"norActual"},
          {text: "Nro Fin", value:"nroFin"},
          {text: "Acciones", value:"action"},
          
      ]
    };
  },
  computed: {
    ...mapState(["ajusteFactura"])
  },
  mounted() {
    this.$store.dispatch("getTalonariosActivos");
  },
  methods: {}
};
</script>
