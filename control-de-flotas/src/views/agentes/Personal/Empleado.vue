<template>
  <v-container>
    <v-form>
      <v-container>
        <v-row>
          <v-col cols="12" md="4">
            <v-text-field
                autofocus
              v-model="personal.objetoPersonal.codigo"
              label="Código Empleado"
              requerid
              disabled
            ></v-text-field>
          </v-col>
          <v-col cols="12" md="4">
            <v-text-field
              v-model="personal.objetoPersonal.ruc"
              
              label="RUC Funcionario"
            ></v-text-field>
          </v-col>
          <v-col cols="12" md="4">
            <v-text-field
              v-model="personal.objetoPersonal.nombre"
              autofocus
              label="Nombre Funcionario"
            ></v-text-field>
          </v-col>
        </v-row>
      </v-container>
      <v-container>
        <v-row>
          <v-col cols="12" md="4">
            <v-text-field
              v-model="personal.objetoPersonal.apellido"
              label="Apellido"
            ></v-text-field>
          </v-col>
          <v-col>
            <v-text-field
              v-model="personal.objetoPersonal.direccion"
              label="Dirección"
            ></v-text-field>
          </v-col>
          <v-col>
            <v-autocomplete
              v-model="personal.objetoPersonal.idcargo"
              label="Cargos"
              :items="cargo.cargos"
              item-text="descripcion"
              item-value="codigo"
            ></v-autocomplete>
          </v-col>
        </v-row>
      </v-container>
      <v-container>
        <v-row>
          <v-col>
            <v-autocomplete
              v-model="personal.objetoPersonal.city"
              label="Ciudad"
              :items="ciudad.ciudad"
              item-text="descripcion"
              item-value="codigo"
            ></v-autocomplete>
          </v-col>
          <v-col>
            <v-text-field
              v-model="personal.objetoPersonal.telefono"
              label="Teléfono"
            ></v-text-field>
          </v-col>
          <v-col>
            <v-text-field v-model="personal.objetoPersonal.email" label="Email"></v-text-field>
          </v-col>
        </v-row>
      </v-container>
      <v-container>
        <v-row>

          <v-col cols="12" md="4">
            <v-menu
              ref="menu2"
              v-model="menu2"
              :close-on-content-click="false"
              :return-value.sync="personal.objetoPersonal.sfechaI"
              transition="scale-transition"
              offset-y
              min-width="290px"
            >
              <template v-slot:activator="{ on }">
                <v-text-field
                :prepend-icon="icons.mdiCalendar"
                  v-model="personal.objetoPersonal.sfechaI"
                  label="Fecha Ingreso"
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker
                locale="Py"
                v-model="personal.objetoPersonal.sfechaI"
                no-title
                scrollable
              >
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu2 = false">Cancel</v-btn>
                <v-btn
                  text
                  color="primary"
                  @click="$refs.menu2.save(personal.objetoPersonal.sfechaI)"
                >OK</v-btn>
              </v-date-picker>
            </v-menu>
          </v-col>
          <v-col cols="12" md="4">
            <v-menu
              ref="menu"
              v-model="menu"
              :close-on-content-click="false"
              :return-value.sync="personal.objetoPersonal.sfechaN"
              transition="scale-transition"
              offset-y
              min-width="290px"
            >
              <template v-slot:activator="{ on }">
                <v-text-field
                :prepend-icon="icons.mdiCalendar"
                  v-model="personal.objetoPersonal.sfechaN"
                  label="Fecha Nacimiento"
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker
                locale="Py"
                v-model="personal.objetoPersonal.sfechaN"
                no-title
                scrollable
              >
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                <v-btn
                  text
                  color="primary"
                  @click="$refs.menu.save(personal.objetoPersonal.sfechaN)"
                >OK</v-btn>
              </v-date-picker>
            </v-menu>
          </v-col>
          <v-col>
            <v-select
              v-model="personal.objetoPersonal.sexo"
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
        </v-row>
      </v-container>
      <v-container>
          <v-row>
              <v-col>
                  <v-checkbox
                    v-model="checkbox"
                    label="Es Usuario?"
                    ></v-checkbox>
                    <p v-show="false">{{personal.objetoPersonal.isUsuario = checkbox}}</p>
              </v-col>
              <v-col>
                  <v-checkbox
                  v-model="personal.objetoPersonal.estado"
                  label="Usuario Activo?">
                  </v-checkbox>
              </v-col>
              <v-col></v-col>
          </v-row>
          <v-row>
              <v-col cols="12" sm="12" md="5">
                  <v-text-field
                    v-show="checkbox"
                    minlength=8
                    hint="Por lo menos 8 caracteres"
                    v-model="personal.objetoPersonal.password"
                    :append-icon="show2 ? icons.mdiEyeCheckOutline : icons.mdiEyeOffOutline "
                    :type="show2 ? 'text' : 'password'"
                    class="input-group--focused"
                    @click:append="show2 = !show2"
                    label="Contraseña"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" sm="12" md="5">
                  <v-text-field
                  v-show="checkbox"
                    :append-icon="show3 ? icons.mdiEyeCheckOutline : icons.mdiEyeOffOutline "
                    :type="show3 ? 'text' : 'password'"
                    label="Repita su contraseña"
                    v-model="personal.objetoPersonal.password1"
                    class="input-group--focused"
                    @click:append="show3 = !show3"
                  ></v-text-field>
                </v-col>
          </v-row>
      </v-container>
      <v-btn @click="editarItem">{{personal.etiqueta}}</v-btn>
    </v-form>
  </v-container>
</template>

<script>import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiFormatListBulletedSquare,
  mdiCheck,
  mdiClose,
  mdiEyeOffOutline,
  mdiCalendar,
  mdiEyeCheckOutline,
} from "@mdi/js";
import { mapState } from "vuex";
export default {
  data() {
    return {
      menu: false,
      insert: this.insertFresh(),
      modal: false,
      menu2: false,
      checkbox: false,
      show2: false,
      show3: false,
      enabled: false,
      // etiqueta: "",
      sex: [
        { sexo: "F", descripcion: "Femenino" },
        { sexo: "M", descripcion: "Masculino" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiCheck,
        mdiClose,
        mdiEyeOffOutline,
        mdiEyeCheckOutline,
        mdiCalendar
      },
    };
  },
  mounted() {
    this.$store.dispatch("loadPersonalOn");
    this.$store.dispatch("loadCiudadOn");
    this.$store.dispatch("loadCargos");
  },
  computed: {
    ...mapState(["personal", "ciudad", "cargo"])
  },
  methods: {
    insertFresh(){
      return{
        codigo: "",
        ruc: "",
        nombre: "",
        apellido: "",
        direccion: "",
        idcargo: "",
        city: "",
        telefono:"",
        email: "",
        sfechaI:"",
        sfechaN:"",
        sexo: "",
        isUsuario:""
      }
    },
      editarItem() {
        this.$store.state.personal.usuario = this.$store.getters.UserLogueado;
          if (this.personal.btnOn) {
            // this.insert = this.personal.objetoPersonal;
            this.insert.ruc = this.personal.objetoPersonal.ruc;
            this.insert.nombre = this.personal.objetoPersonal.nombre;
            this.insert.apellido = this.personal.objetoPersonal.apellido;
            this.insert.direccion = this.personal.objetoPersonal.direccion;
            this.insert.idcargo = this.personal.objetoPersonal.idcargo;
            this.insert.city = this.personal.objetoPersonal.city;
            this.insert.telefono = this.personal.objetoPersonal.telefono;
            this.insert.email = this.personal.objetoPersonal.email;
            this.insert.sfechaN = this.personal.objetoPersonal.sfechaN;
            this.insert.sfechaI = this.personal.objetoPersonal.sfechaI;
            this.insert.sexo = this.personal.objetoPersonal.sexo;
            this.insert.password = this.personal.objetoPersonal.password;
            this.insert.isUsuario = this.personal.objetoPersonal.isUsuario;
            console.log("this is insert: ", this.insert);
            this.$store.dispatch("createPersonal", this.insert).then((result) => {
              this.personal.objetoPersonal = [];
            }).catch((err) => {
              
            });
          } else {              
              this.$store.dispatch("updatePersonal", this.personal.objetoPersonal).then(() => {
                this.personal.objetoPersonal = [];
              this.personal.btnOn = true;
              }).catch((err) => {
                console.log(err)
              });
          }
      }
  },
};
</script>