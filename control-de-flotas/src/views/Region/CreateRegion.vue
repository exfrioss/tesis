<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <h1>Registrar Región</h1>
        <RegionShow />
        <v-form v-model="valid" @submit.prevent="createRegion">
          <v-text-field
            minlength="1"
            maxlength="1"
            @keyup="validarRegion()"
            autofocus
            v-model="regiones.codigo"
            :counter="1"
            :rules="codigoRules"
            required
            label="Código (*)"
            type="text"
          ></v-text-field>
          <v-alert 
          type="error"
          :value="alert"
          transition="scale-transition"
          >
            Región ya está en uso
          </v-alert>

          <v-text-field
            v-model="regiones.descripcion"
            :rules="descripcionRules"
            required
            label="Descripción (*)"
            type="text"
          ></v-text-field>

          <v-checkbox
            v-model="regiones.estado"
            :rules="estadoRules"
            required
            input-value="true"
            value
            disabled
            label="Activo"
          ></v-checkbox>

          <v-btn :disabled="!valid" type="submit">Guardar</v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import RegionShow from "./RegionShow";
export default {
  data() {
    return {
      alert: false,
      regiones: this.createFreshRegion(),
      valid: true,
      codigoRules: [
        v => !!v || "Código es requerido",
        v => v.length <= 1 || "Código sólo puede tener 1 digito",
      ],
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"]
    };
  },
  mounted() {
    this.$store.dispatch("loadRegiones");
  },
  methods: {
    createFreshRegion() {
      return {
        codigo: "",
        descripcion: "",
        estado: true
      };
    },
    validarRegion() {
      console.log(this.regiones.codigo);
      this.$store.dispatch("regionbyId", this.regiones.codigo)
      if (this.$store.state.region.countR > 0) {
        this.alert = true;
        this.regiones.codigo = ""
        // console.log(this.alert);
      } else {
        this.alert = false;
        // console.log(this.alert);
      }
    },
    createRegion() {
      this.$store.state.region.usuario = this.$store.getters.UserLogueado;
      this.$store.dispatch("createRegion", this.regiones).then((result) => {
        this.regiones = this.createFreshRegion();
        this.$router.push('/listRegion');
      }).catch((err) => {
        console.log(err)
      });
      
    }
  },
  components: {
    RegionShow
  }
};
</script>

<style lang="scss" scoped>
</style>