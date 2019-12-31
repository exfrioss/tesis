<template>
  <div>
    <ShowCliente />
    <v-container>
      <v-row>
        <v-col>
          <h1>Registrar Cliente</h1>
          <v-form v-model="valid" @submit.prevent="createCliente">
            <v-container>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field
                    minlength="1"
                    maxlength="7"
                    @keyup="validarCliente()"
                    autofocus
                    v-model="cliente.codigo"
                    :counter="7"
                    :rules="codigoRules"
                    required
                    label="C.I-N°"
                    type="text"
                  ></v-text-field>
                  <v-alert
                    type="error"
                    :value="alert"
                    transition="scale-transition"
                  >El registro ya está en uso</v-alert>
                </v-col>
                <v-col cols="12" md="2">
                  <v-text-field
                    min="0"
                    max="9"
                    v-model="cliente.ruc"
                    :rules="rucRules"
                    required
                    label="RUC"
                    type="number"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="6">
                  <v-text-field
                    v-model="cliente.nombre"
                    :rules="descripcionRules"
                    required
                    label="Nombres"
                    type="text"
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>

            <v-container>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="cliente.apellido"
                    :rules="apellidoRules"
                    required
                    label="Apellidos"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="cliente.telefono"
                    :rules="telefonoRules"
                    required
                    label="Teléfono"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="cliente.email"
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
                <v-col cols="12" md="6">
                  <v-text-field v-model="cliente.direccion" label="Dirección" type="text"></v-text-field>
                </v-col>
                <v-col cols="12" md="6">
                  <v-select
                    v-model="cliente.ciudad"
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
                <v-col cols="12" sm="6" md="6">
                  <v-menu
                    ref="menu"
                    v-model="menu"
                    :close-on-content-click="false"
                    :return-value.sync="cliente.fechaN"
                    transition="scale-transition"
                    offset-y
                    min-width="290px"
                  >
                    <template v-slot:activator="{ on }">
                      <v-text-field
                        :prepend-icon="icons.mdiCalendar"
                        v-model="cliente.fechaN"
                        label="Fecha de Nacimiento"
                        v-on="on"
                      ></v-text-field>
                    </template>
                    <v-date-picker locale="Py" v-model="cliente.fechaN" no-title scrollable>
                      <v-spacer></v-spacer>
                      <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                      <v-btn text color="primary" @click="$refs.menu.save(cliente.fechaN)">OK</v-btn>
                    </v-date-picker>
                  </v-menu>
                </v-col>

                <v-col cols="12" sm="6" md="6">
                  <v-menu
                    ref="menu2"
                    v-model="menu2"
                    :close-on-content-click="false"
                    :return-value.sync="cliente.fechaI"
                    transition="scale-transition"
                    offset-y
                    min-width="290px"
                  >
                    <template v-slot:activator="{ on }">
                      <v-text-field
                        v-model="cliente.fechaI"
                        label="Fecha Ingreso"
                        :prepend-icon="icons.mdiCalendar"
                        v-on="on"
                      ></v-text-field>
                    </template>
                    <v-date-picker v-model="cliente.fechaI" no-title scrollable>
                      <v-spacer></v-spacer>
                      <v-btn text color="primary" @click="menu2 = false">Cancel</v-btn>
                      <v-btn text color="primary" @click="$refs.menu2.save(cliente.fechaI)">OK</v-btn>
                    </v-date-picker>
                  </v-menu>
                </v-col>

                <v-col cols="12" md="6"></v-col>
              </v-row>
            </v-container>
            <v-row>
              <v-col>
                <v-select
                  v-model="cliente.sexo"
                  :items="sex"
                  item-value="sexo"
                  item-text="descripcion"
                  :rules="[v => !!v || 'Sexo es requerido ?) ']"
                  label="Sexo"
                  required
                >
                  <template v-slot:item="{ item }">{{item.sexo}} - {{item.descripcion}}</template>
                </v-select>
              </v-col>
              <v-col>
                <v-checkbox
                  v-model="cliente.estado"
                  required
                  input-value="true"
                  value
                  label="Activo"
                ></v-checkbox>
              </v-col>
              <v-col>
                <v-checkbox
                @change="onCheckboxChange1"
                  v-model="checkbox2"
                  required
                  input-value="true"
                  value
                  label="Es Usuario?"
                ></v-checkbox>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" sm="12" md="5">
                <v-text-field
                  @keyup="validarPassword()"
                  v-show="checkbox2"
                  minlength="8"
                  hint="Por lo menos 8 caracteres"
                  v-model="cliente.password"
                  :append-icon="show2 ? icons.mdiEyeCheckOutline : icons.mdiEyeOffOutline "
                  :type="show2 ? 'text' : 'password'"
                  class="input-group--focused"
                  @click:append="show2 = !show2"
                  label="Contraseña"
                ></v-text-field>
              </v-col>
              <v-col cols="12" sm="12" md="5">
                <v-text-field
                  v-show="checkbox2"
                  @keyup="validarPassword()"
                  :append-icon="show3 ? icons.mdiEyeCheckOutline : icons.mdiEyeOffOutline "
                  :type="show3 ? 'text' : 'password'"
                  label="Repita su contraseña"
                  v-model="cliente.password1"
                  class="input-group--focused"
                  :rules="passwordRules"
                  @click:append="show3 = !show3"
                ></v-text-field>
              </v-col>
            </v-row>

            <v-btn :disabled="!valid" type="submit">Guardar</v-btn>
          </v-form>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import ShowCliente from "./ShowCliente";
import { mapState } from "vuex";
import {
  mdiAccount,
  mdiEyeCheckOutline,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiFormatListBulletedSquare,
  mdiCheck,
  mdiClose,
  mdiCalendar,
  mdiPlus,
  mdiContentSave,
  mdiEyeOffOutline
} from "@mdi/js";
export default {
  data() {
    return {
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiContentSave,
        mdiEyeCheckOutline,
        mdiPlus,
        mdiCalendar,
        mdiEyeOffOutline
      },
      checkbox2: false,
      menu: false,
      menu2: false,
      modal: false,
      cliente: this.createFreshCliente(),
      alert: false,
      valid: true,
      show3: false,
      show2: false,
      codigoRules: [
        v => (!!v ? (this.valid = false) : "C.I-N° es requerido"),
        v => v.length <= 7 || "Código sólo puede tener 3 valores"
      ],
      descripcionRules: [v => !!v || "Nombre es requerido"],
      apellidoRules: [v => !!v || "Apellidos es requerido"],
      telefonoRules: [v => !!v || "Teléfono es requerido"],
      emailRules: [
        v => !!v || "Email es requerido",
        v =>
          /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(
            v
          ) || "E-mail no válido"
      ],
      rucRules: [
        v => !!v || "Nombre es requerido",
        v => v.length <= 1 || "RUC sólo puede tener 1 valor"
      ],
      passwordRules: [v => !!v || "Campo requerido"],
      sex: [
        { sexo: "F", descripcion: "Femenino" },
        { sexo: "M", descripcion: "Masculino" }
      ]
    };
  },
  components: {
    ShowCliente
  },
  mounted() {
    this.$store.dispatch("loadCiudades");
    this.$store.dispatch("loadClientes");
  },
  computed: {
    ...mapState(["ciudad"])
  },
  methods: {
    createFreshCliente() {
      
      return {
        codigo: "",
        ruc: "",
        nombre: "",
        apellido: "",
        email: "",
        telefono: "",
        direccion: "",
        ciudad: "",
        fechaN: new Date().toISOString().substr(0, 10),
        fechaI: new Date().toISOString().substr(0, 10),
        sexo: "",
        estado: true,
        isUsuario: false,
        password: "",
        password1: "",
      };
    },
    createCliente() {
      this.$store.state.cliente.usuario = this.$store.getters.UserLogueado;
      this.$store
        .dispatch("createCliente", this.cliente)
        .then(() => {
          this.cliente = this.createFreshCliente();
          this.$router.push("/listCliente");
        })
        .catch(err => {
          console.log(err);
        });
    },
    validarCliente() {
      this.$store.dispatch("clientebyId", this.cliente.codigo);
      if (this.$store.state.cliente.countR > 0) {
        this.alert = true;
        this.cliente.codigo = "";
      } else {
        this.alert = false;
      }
    },
    onCheckboxChange1(newValue, oldValue) {
      this.cliente.isUsuario = this.checkbox2;
    },
    validarPassword() {
      if (this.cliente.password != this.cliente.password1) {
        console.log("Las contraseñas no coinciden");
      } else {
        console.log("Las contraseñas coinciden");
      }
    }
  }
};
</script>