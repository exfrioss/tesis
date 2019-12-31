<template>
  <div>
    <ShowCiudad />
    <br />
    <v-container>
      <v-row>
        <v-col>
          <h1>Registrar Ciudad</h1>
          <v-form v-model="valid" @submit.prevent="createCiudad">
            <v-text-field
              minlength="1"
              maxlength="3"
              @keyup="validarCiudad()"
              autofocus
              v-model="ciudad.codigo"
              :counter="3"
              :rules="codigoRules"
              required
              label="Código"
              type="text"
            ></v-text-field>
            <v-alert
              type="error"
              :value="alert"
              transition="scale-transition"
            >El registro ya está en uso</v-alert>

            <v-text-field
              v-model="ciudad.descripcion"
              :rules="descripcionRules"
              required
              label="Descripción"
              tupe="text"
            ></v-text-field>

            <v-select
              v-model="ciudad.departamento"
              :items="departamento.departamentos"
              item-value="codigo"
              item-text="descripcion"
              :rules="[v => !!v || 'Región es requerido']"
              label="Departamento"
              required
            >
              <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
            </v-select>

            <v-checkbox v-model="ciudad.estado" required input-value="true" value label="Activo"></v-checkbox>

            <v-btn :disabled="!valid" type="submit">Guardar</v-btn>
          </v-form>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
<script>
import ShowCiudad from './ShowCiudad';
import {mapState} from 'vuex';
export default {
  data() {
    return {
      alert: false,
      valid: true,
      ciudad: this.createFreshCiudad(),
      codigoRules: [
        v => (!!v ? (this.valid = false): "Código es requerido"),
        v => v.length <=3 || "Código sólo puede tener 3 valores"
      ],
      descripcionRules: [v=> !!v || "Descripción es requerido"]
    }
  },
  mounted () {
    this.$store.dispatch("loadDepartamentos");
    this.$store.dispatch("loadCiudades")
  },
  computed: {
    ...mapState(["departamento"]),
    userLogueado(){
      console.log(this.$store.getters.UserLogueado)
      return this.$store.getters.UserLogueado
  }
  },
  components: {
    ShowCiudad,
  },
  methods: {
    createFreshCiudad() {
      return{
        codigo: "",
        descripcion: "",
        departamento: "",
        estado: "true",
      };
    },
    createCiudad(){
      this.$store.state.ciudad.usuario = this.$store.getters.UserLogueado;
      this.$store.dispatch("createCiudad", this.ciudad).then((result) => {
        this.ciudad = this.createFreshCiudad(); 
        this.$router.push('/listCiudad')
      }).catch((err) => {
        
      });
    },
    validarCiudad(){
      this.$store.dispatch("ciudadbyId", this.ciudad.codigo)
      if (this.$store.state.ciudad.countR > -1) {
        this.alert = true
        this.ciudad.codigo = ""
      } else {
        this.alert = false
      }
    }
  },
};
</script>