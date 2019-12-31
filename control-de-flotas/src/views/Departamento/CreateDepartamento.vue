<template>
  <div>
    <ShowDepartamento />
    <br />
    <v-container>
      <v-row>
        <v-col>
          <h1>Registrar Departamento</h1>
          <v-form v-model="valid" @submit.prevent="createDepartamento">
            <v-text-field
              minlength="1"
              maxlength="2"
              @keyup="validarDepartamento()"
              autofocus
              v-model="departamento.codigo"
              :counter="2"
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
              v-model="departamento.descripcion"
              :rules="descripcionRules"
              required
              label="Descripción"
              tupe="text"
            ></v-text-field>

            <v-select
              v-model="departamento.region"
              :items="region.regiones"
              item-value="codigo"
              item-text="descripcion"
              :rules="[v => !!v || 'Región es requerido']"
              label="Región"
              required
            >
              <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
            </v-select>

            <v-checkbox
              v-model="departamento.estado"
              required
              input-value="true"
              value3
              disabled
              label="Activo"
            ></v-checkbox>

            <v-btn :disabled="!valid" type="submit">Guardar</v-btn>
          </v-form>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import ShowDepartamento from "./ShowDepartamento";
import { mapState } from "vuex";
export default {
  data() {
    return {
      alert: false,
      departamento: this.createFreshDepartamento(),
      // regiones: this.$store.state.regiones.descripcion,
      valid: true,
      codigoRules: [
        v => (!!v ? (this.valid = false) : "Código es requerido"),
        v => v.length <= 2 || "Código sólo puede tener 2 valores"
      ],
      descripcionRules: [v => !!v || "Descripción es necesario"]
    };
  },
  mounted() {
    this.$store.dispatch("loadRegiones");
    this.$store.dispatch("loadDepartamentos");
  },
  computed: {
    ...mapState(["region"])
  },
  components: {
    ShowDepartamento
  },
  methods: {
    createFreshDepartamento() {
      return {
        codigo: "",
        descripcion: "",
        region: "",
        estado: "true"
      };
    },
    createDepartamento() {
      this.$store.state.departamento.usuario = this.$store.getters.UserLogueado;
      this.$store.dispatch("createDepartamento", this.departamento).then((result) => {
        this.departamento = this.createFreshDepartamento();
        this.$router.push('/listDepartamento')
      }).catch((err) => {
        
      });
      
    },
    validarDepartamento() {
      this.$store.dispatch("departamentobyId", this.departamento.codigo)
      if (this.$store.state.departamento.countR > -1) {
        this.alert = true;
        this.departamento.codigo = "";
        // console.log(this.alert);
      } else {
        this.alert = false;
        // console.log(this.alert);
      }
    }
  }
};
</script>