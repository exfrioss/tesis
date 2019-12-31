<template>
  <div>
    <NavBarInsumo />
    <br />
    <v-container>
      <v-row>
        <v-col>
          <h1>{{title}}</h1>
          <v-form v-model="valid" @submit.prevent="createInsumos">
            <v-text-field
              minlength="1"
              maxlength="3"
              @keyup="validarInsumo()"
              autofocus
              v-model="insumos.codigo"
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
              v-model="insumos.descripcion"
              :rules="descripcionRules"
              required
              label="Descripción"
              tupe="text"
            ></v-text-field>

            <v-text-field
              v-model="insumos.precio"
              :rules="descripcionRules"
              required
              label="Precio"
              tupe="number"
            ></v-text-field>

            <v-select
              v-model="insumos.iva"
              :items="ivas"
              :rules="[v => !!v || 'Iva es requerido']"
              label="Iva"
              required
            >
            </v-select>

            <v-container>
              <v-row>
                <v-col cols="12" md="6">
                  <v-text-field
                    v-model="insumos.stockM"
                    :counter="10"
                    label="Stock mínimo"
                    required
                    type="number"
                  ></v-text-field>
                </v-col>

                <v-col cols="12" md="6">
                  <v-text-field
                    v-model="insumos.stockI"
                    :counter="10"
                    label="Stock Ideal"
                    required
                    type="number"
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>

            <v-checkbox
              disabled
              v-model="insumos.estado"
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
  </div>
</template>
<script>
import NavBarInsumo from "../../components/NavBarInsumo";
import { mapState } from "vuex";
export default {
  data() {
    return {
      title: "Registrar Insumo",
      alert: false,
      valid: true,
      insumos: this.createFreshInsumos(),
      codigoRules: [
        v => (!!v ? (this.valid = false) : "Código es requerido"),
        v => v.length <= 10 || "Código sólo puede tener 10 caracteres"
      ],
      descripcionRules: [v => !!v || "Campo requerido"],
      ivas: ["0", "5", "10"]
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
    createFreshInsumos() {
      return {
        codigo: "",
        descripcion: "",
        precio: "",
        iva: "",
        stockI: "",
        stockM: "",
        estado: "true",
        usuario: ""
      };
    },
    createInsumos() {
      this.insumos.usuario = this.$store.getters.UserLogueado;
      this.$store.dispatch("createInsumo", this.insumos);
      this.ciudad = this.createFreshInsumos();
    },
    validarInsumo() {
      this.$store.dispatch("insumobyId", this.insumos.codigo);
      if (this.$store.state.insumo.countR > -1) {
        this.alert = true;
        this.insumos.codigo = "";
      } else {
        this.alert = false;
      }
    }
  }
};
</script>