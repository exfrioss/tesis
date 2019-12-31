<template>
  <div>
    <ShowProveedor/>
    <br />
    <v-container>
      <v-row>
        <v-col>
          <h1>Registrar Proveedor</h1>
          <v-form v-model="valid" @submit.prevent="createProveedor">
            <v-container>
              <v-row>
                <v-col cols="12" md="6">
                  <v-text-field
                    minlength="1"
                    maxlength="7"
                    autofocus
                    v-model="proveedor.codigo"
                    :counter="7"
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
                </v-col>
                <v-col cols="12" md="6">
                  <v-text-field
                    minlength="1"
                    maxlength="1"
                    v-model="proveedor.ruc"
                    :counter="1"
                    :rules="rucRules" 
                    required
                    label="Ruc"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="proveedor.razonSocial"
                    :rules="descripcionRules"
                    required
                    label="Razon Social"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field v-model="proveedor.nombreContacto" label="Nombre de Contacto" type="text"></v-text-field>
                </v-col>
                 <v-col cols="12" md="4">
                  <v-text-field
                    v-model="proveedor.telefonoContacto"
                    label="Teléfono del Contacto"
                    type="text"
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>

            <v-container>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="proveedor.direccion"
                    required
                    label="Dirección"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="proveedor.telefono"
                    :rules="telefonoRules"
                    required
                    label="Teléfono de la empresa"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="proveedor.email"
                    :rules="emailRules"
                    required
                    label="Email"
                    type="text"
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>

            <v-container>
              <v-row>
                <v-col cols="12" md="12">
                  <v-select
                    v-model="proveedor.ciudad"
                    :items="ciudad.ciudad"
                    item-value="codigo"
                    item-text="descripcion"
                    :rules="[v => !!v || 'Ciudad es requerido']"
                    label="Ciudad"
                    required
                  >
                    <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
                  </v-select>
                </v-col>
              </v-row>
            </v-container>

            <v-container>
              <v-row>
                  <v-col cols="12" sm="12" md="12">
                    <v-menu
                      ref="menu"
                      v-model="menu"
                      :close-on-content-click="false"
                      :return-value.sync="fechaI"
                      transition="scale-transition"
                      offset-y
                      min-width="290px"
                    >
                      <template v-slot:activator="{ on }">
                        <v-text-field
                          v-model="proveedor.fechaI"
                          label="Fecha de Ingreso"
                          
                          readonly
                          v-on="on"
                        ></v-text-field>
                      </template>
                      <v-date-picker locale="Py" v-model="proveedor.fechaI" no-title scrollable>
                        <v-spacer></v-spacer>
                        <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                        <v-btn text color="primary" @click="$refs.menu.save(proveedor.fechaI)">OK</v-btn>
                      </v-date-picker>
                    </v-menu>
                  </v-col>
              </v-row>
            </v-container>

            <v-checkbox v-model="proveedor.estado" required input-value="true" value label="Activo"></v-checkbox>

            <v-btn :disabled="!valid" type="submit">Guardar</v-btn>
          </v-form>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import ShowProveedor from "./ShowProveedor";
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
      fechaI: new Date().toISOString().substr(0, 10),
      menu: false,
      modal: false,
      menu2: false,
      proveedor: this.createFreshProveedor(),
      alert: false,
      valid: true,
      codigoRules: [
        v => (!!v ? (this.valid = false) : "Código es requerido"),
        v => v.length <= 10 || "Código sólo puede tener valores"
      ],
      descripcionRules: [v => !!v || "Nombre es requerido"],
      apellidoRules: [v => !!v || "Apellidos es requerido"],
      telefonoRules: [v => !!v || "Teléfono es requerido"],
      rucRules: [
        v => !!v || "Nombre es requerido",
        v => v.length <= 1 || "RUC sólo puede tener valor de un digito"
      ],
      emailRules: [
        v => !!v || "Email es requerido",
        v =>
          /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(
            v
          ) || "E-mail no válido"
      ],
      sex: [
          {sexo: 'F', descripcion:"Femenino"},
          {sexo: 'M', descripcion:"Masculino"}
      ]
    };
  },
  components: {
    ShowProveedor
  },
  mounted() {
    this.$store.dispatch("loadCiudades");
    this.$store.dispatch("loadProveedor");
  },
  computed: {
    ...mapState(["ciudad"])
  },
  methods: {
    createFreshProveedor() {
      return {
        codigo: "",
        ruc: "",
        nombre: "",
        apellido: "",
        email: "",
        telefono: "",
        direccion: "",
        ciudad: "",
        fechaI: "",
        sexo: "",
        estado: "true"
      };
    },
    createProveedor() {
      this.$store.state.proveedor.usuario = this.$store.getters.UserLogueado;
      this.$store.dispatch("createProveedor", this.proveedor);
      this.proveedor = this.createFreshProveedor();
    },
    validarProveedor() {
      this.$store.dispatch("proveedorbyId", this.proveedor.codigo);
      if (this.$store.state.proveedor.countR > 0) {
        this.alert = true;
        this.proveedor.codigo = "";
      } else {
        this.alert = false;
      }
    }
  }
};
</script>