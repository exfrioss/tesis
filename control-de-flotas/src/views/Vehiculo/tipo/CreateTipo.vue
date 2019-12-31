<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <ShowTipo />
        <h1>{{title}}</h1>
        <v-form @submit.prevent="createTipo">
          <v-text-field
            v-model="insert.descripcion"
            :rules="descripcionRules"
            required
            label="Descripción"
            type="text"
          ></v-text-field>
          <v-text-field
            v-model="insert.pesoNeto"
            :rules="descripcionRules"
            required
            label="Peso neto del vehiculo"
            type="text"
          ></v-text-field>
          <v-row>
              <v-checkbox
            v-model="insert.estado"
            :rules="estadoRules"
            required
            input-value="true"
            value
            disabled
            label="Activo"
          ></v-checkbox>
           &nbsp&nbsp&nbsp&nbsp
          <v-checkbox
            v-model="insert.isAsociado"
            :rules="estadoRules"
            required
            input-value="true"
            value
            label="Es asociado?"
          ></v-checkbox>
          </v-row>
          
          <v-btn type="submit">Guardar</v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiFormatListBulletedSquare,
  mdiContentSave,
  mdiPlus,
  mdiCalendar
} from "@mdi/js";
import ShowTipo from "./ShowTipo";
export default {
  data() {
    return {
      menu: false,
      menu2: false,
      modal: false,
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiContentSave,
        mdiPlus,
        mdiCalendar
      },
      alert: false,
      title: "Registrar Tipo de vehiculo",
      insert: this.createFreshTipo(),
      valid: true,
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"]
    };
  },
  methods: {
    createFreshTipo() {
      return {
        codigo: "",
        descripcion: "",
        pesoNeto: "",
        isAsociado: false,
        estado: true
      };
    },
    createTipo() {
      this.$store.dispatch("createTipo", this.insert);
      this.modeloInsert = this.createFreshTipo();
      this.$router.push("listTipo");
      //   this.$store.dispatch("loadMarcasActivas");
    }
  },
  components: {
    ShowTipo
  }
};
</script>