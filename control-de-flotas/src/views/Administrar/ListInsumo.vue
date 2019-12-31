<template>
  <v-container>
    <v-card>
      <NavBarInsumo />
      <v-card-title>
        Insumo
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-data-table :headers="headers" :items="insumo.insumos" :search="search">
        <template v-slot:item.estado="{ item }">
          <v-icon>{{item.estado==1 ? icons.mdiCheck : icons.mdiClose}}</v-icon>
        </template>
        <template v-slot:item.stock_actual="{ item }">
          <v-chip :color="getColor(item.stock_minimo, item.stock_actual, item.stock_ideal)" dark>{{ item.stock_actual }}</v-chip>
        </template>
        <template v-slot:item.stock_ideal="{ item }">
          <v-chip :color="getColorStockI(item.stock_minimo, item.stock_ideal)" dark>{{ item.stock_ideal }}</v-chip>
        </template>
        <template v-slot:item.stock_minimo="{ item }">
          <v-chip :color="getColorStockM(item.stock_minimo)" dark>{{ item.stock_minimo }}</v-chip>
        </template>
        
        <template v-slot:item.action="{ item }">
          <v-btn text rounded>
            <v-icon small class="mr-2">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn text rounded>
            <v-icon small>{{ icons.mdiDelete }}</v-icon>
          </v-btn>
        </template>
      </v-data-table>
    </v-card>
  </v-container>
</template>

<script>
import NavBarInsumo from "../../components/NavBarInsumo";
import { mapState } from "vuex";
import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiFormatListBulletedSquare,
  mdiCheck,
  mdiClose
} from "@mdi/js";
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
        { text: "Stock ideal", value: "stock_ideal" },
        { text: "Estado", value: "estado" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiCheck,
        mdiClose
      }
    };
  },
  mounted() {
    this.$store.dispatch("loadInsumos");
  },
  computed: {
    ...mapState(["insumo"])
  },
  components: {
    NavBarInsumo
  },
  methods: {
      getColor(stock_minimo, stock_actual, stock_ideal) {
        console.log(stock_actual)
        if ((stock_actual > (stock_minimo + stock_minimo) || stock_actual == stock_ideal)&& stock_actual<(stock_ideal + 1)) return 'green'
        else if (stock_actual > stock_minimo && stock_actual<(stock_ideal)) return 'orange'
        else return 'red';
      },
       getColorStockM (stock_minimo) {
        if (stock_minimo <= stock_minimo) return 'red'
      },
      getColorStockI (stock_minimo, stock_ideal) {
        if (stock_ideal > (stock_minimo+stock_minimo)|| stock_ideal ==stock_ideal) return 'green'
      },
    },
};
</script>