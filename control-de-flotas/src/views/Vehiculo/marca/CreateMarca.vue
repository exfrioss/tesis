<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <h1>{{title}}</h1>
        <showMarca/>
        <v-form @submit.prevent="createMarca">
          <v-text-field
            v-model="marcaregister.descripcion"
            :rules="descripcionRules"
            required
            label="Descripción"
            type="text"
          ></v-text-field>

          <v-checkbox
            v-model="marcaregister.estado"
            :rules="estadoRules"
            required
            input-value="true"
            value
            disabled
            label="Activo"
          ></v-checkbox>
          <v-btn type="submit">Next</v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import showMarca from "./ShowMarca";
export default {
  data() {
    return {
      alert: false,
      title: "Registrar Marca",
      marcaregister: this.createFreshMarca(),
      valid: true,
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"]
    };
  },
  methods: {
    createFreshMarca() {
      return {
        codigo: "",
        descripcion: "",
        estado: true
      };
    },
    createMarca() {
      this.$store.dispatch("createMarca", this.marcaregister);
      this.marcaregister = this.createFreshMarca();
      this.$router.push('listMarca');
    //   this.$store.dispatch("loadMarcasActivas");
    }
  },
  components: {
      showMarca
  }
};
</script>

<style lang="scss" scoped>
</style>