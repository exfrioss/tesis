<template>
  <v-container>
    <h1>Cargos</h1>
    <ShowCargo/>
      <v-col>
        <v-data-table
          md="4"
          :headers="headers"
          :items="cargo.cargos"
          :items-per-page="5"
          class="elevation-1"
        >
          <template v-slot:item.estado="{ item }">
            <v-chip>{{item.estado==1 ? 'Activo' : 'Inactivo'}}</v-chip>
          </template>
          <template v-slot:item.action="{ item }">
            <v-btn text rounded>
              <v-icon small class="mr-2" @click="editItem(item)">{{icons.mdiPencil}}</v-icon>
            </v-btn>
            <v-btn text rounded>
              <v-icon small @click="deleteItem(item)">{{ icons.mdiDelete }}</v-icon>
            </v-btn>
          </template>
        </v-data-table>
      </v-col>
  </v-container>
</template>
<script>
import ShowCargo from './ShowCargo';
import { mdiAccount, mdiPencil, mdiShareVariant, mdiDelete } from "@mdi/js";
import { mapState } from "vuex";
export default {
  // name: "listRegion",
  data() {
    return {
      headers: [
        { text: "Código", value: "codigo" },
        { text: "Descripción", value: "descripcion" },
        { text: "Estado", value: "estado" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete
      }
    };
  },
  mounted() {
    this.$store.dispatch("loadCargos");
  },
  computed: {
    regionesActivas(){
      return $store.getters.cargoActivas
    },
   ...mapState(['cargo']), 
  },
  components:{
    ShowCargo,
  }
};
</script>