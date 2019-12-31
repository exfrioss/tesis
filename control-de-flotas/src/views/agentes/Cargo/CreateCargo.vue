<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <h1>Registrar Cargo</h1>
        <ShowCargo />
        <v-form v-model="valid" @submit.prevent="createCargo">
          <!-- <v-text-field
            minlength="1"
            maxlength="1"
            @keyup="validarRegion()"
            autofocus
            v-model="regiones.codigo"
            :counter="1"
            :rules="codigoRules"
            required
            label="Código"
            type="text"
          ></v-text-field>
          <v-alert 
          type="error"
          :value="alert"
          transition="scale-transition"
          >
            Región ya está en uso
          </v-alert> -->

          <v-text-field
            v-model="cargos.descripcion"
            :rules="descripcionRules"
            autofocus
            required
            label="Descripción"
            type="text"
          ></v-text-field>

          <v-checkbox
            v-model="cargos.estado"
            :rules="estadoRules"
            required
            input-value="true"
            value
            label="Activo"
          ></v-checkbox>

          <v-btn :disabled="!valid" type="submit">Guardar</v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import ShowCargo from "./ShowCargo";
export default {
  data() {
    return {
      alert: false,
      cargos: this.createFreshCargo(),
      valid: true,
    //   codigoRules: [
    //     v => !!v || "Código es requerido",
    //     v => v.length <= 1 || "Código sólo puede tener 1 valor",
    //   ],
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"]
    };
  },
  mounted() {
    this.$store.dispatch("loadCargos");
  },
  methods: {
    createFreshCargo() {
      return {
        // codigo: "",
        descripcion: "",
        estado: true
      };
    },
    validarCargo() {
      this.$store.dispatch("cargosbyId", this.cargos.codigo)
      if (this.$store.state.cargo.countR > 0) {
        this.alert = true;
        this.cargos.codigo = ""
        // console.log(this.alert);
      } else {
        this.alert = false;
        // console.log(this.alert);
      }
    },
    createCargo() {
      this.$store.state.cargo.usuario = this.$store.getters.UserLogueado;
      this.$store.dispatch("createCargo", this.cargos);
      this.cargos = this.createFreshCargo();
    }
  },
  components: {
    ShowCargo
  }
};
</script>

<style lang="scss" scoped>
</style>