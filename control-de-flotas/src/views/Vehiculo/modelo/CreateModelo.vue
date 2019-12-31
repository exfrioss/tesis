<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <showModelo/>
        <h1>{{title}}</h1>
        <v-form @submit.prevent="createMarca">
          <v-text-field
          autofocus
            v-model="modeloInsert.descripcion"
            :rules="descripcionRules"
            required
            label="Descripción"
            type="text"
          ></v-text-field>

          <v-text-field
            v-model="modeloInsert.anio"
            :rules="descripcionRules"
            required
            label="Año del modelo"
            type="text"
          ></v-text-field>

          <v-checkbox
            v-model="modeloInsert.estado"
            :rules="estadoRules"
            required
            input-value="true"
            value
            disabled
            label="Activo"
          ></v-checkbox>
          <v-btn type="submit">Guardar</v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import showModelo from "./ShowModelo";
export default {
  data() {
    return {
      alert: false,
      title: "Registrar Modelo",
      modeloInsert: this.createFreshModelo(),
      valid: true,
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"]
    };
  },
  methods: {
    createFreshModelo() {
      return {
        codigo: "",
        anio: "",
        descripcion: "",
        estado: true
      };
    },
    createMarca() {
      this.$store.dispatch("createModelo", this.modeloInsert);
      this.modeloInsert = this.createFreshModelo();
      this.$router.push('listModelo');
    //   this.$store.dispatch("loadMarcasActivas");
    }
  },
  components: {
      showModelo
  }
};
</script>

<style lang="scss" scoped>
</style>