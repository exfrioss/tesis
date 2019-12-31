<template>
  <v-container>
    <v-card>
      <!-- <v-alert type="success"> -->
      <v-alert :color="type"  v-if="type">{{this.$store.state.personal.message}}</v-alert>
    <!-- </v-alert> -->
      <ShowEmployee />
      <v-card-title>
        Personal&nbsp&nbsp&nbsp&nbsp
        <v-checkbox v-model="checkbox1" @change="onCheckboxChange" label="Eliminados:"></v-checkbox>
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-data-table :headers="headers" :items="personal.personal" :search="search">
        <template v-slot:item.estado="{ item }">
          <v-icon>{{item.estado==1 ? icons.mdiCheck : icons.mdiClose}}</v-icon>
        </template>
        <template hide-default-header:True v-slot:item.ciudadNombre="{ item }">
          [{{item.city}}] - {{item.ciudadNombre}}
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn text rounded @click="editItem(item)">
            <v-icon small class="mr-2">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn :disabled="checkbox1" text rounded @click="activarDialogo(item.codigo)">
            <v-icon small>{{ icons.mdiDelete }}</v-icon>
          </v-btn>
        </template>
      </v-data-table>

      <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="430">
        <v-card>
          <v-card-title class="headline">"Eliminar Registro"</v-card-title>
          <v-card-text>
            El registro no será eliminado de la base de datos,
            <p>pasará de estar "avtivo" a "inactivo".</p>
            <p>Podrá cambiar esto, siempre y cuando:</p>
            <p>El registro no esté asociado con otro registro activo</p>
            <p>Desea "eliminar" el registro?</p>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="red darken-1" text @click="dialog = false">Cancelar</v-btn>
            <v-btn color="green darken-1" text @click="eliminarRegistro(idM)">Eliminar</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>

    <v-row justify="center">
        <v-dialog v-model="dialog2" fullscreen hide-overlay transition="dialog-bottom-transition">
          <v-card>
            <v-toolbar dark color="primary">
              <v-btn icon dark @click="limpiarFormulario">
                <v-icon>mdi-close</v-icon>
              </v-btn>
              <v-toolbar-title>Editar Registro</v-toolbar-title>
              <v-spacer></v-spacer>
              <v-toolbar-items>
                <v-btn dark text @click="limpiarFormulario">Cancelar</v-btn>
              </v-toolbar-items>
            </v-toolbar>
            <v-list three-line subheader>
              <v-container>
                <empleado/>
              </v-container>
            </v-list>
          </v-card>
        </v-dialog>
      </v-row>


    </v-card>
  </v-container>
</template> 

<script>
import ShowEmployee from "./ShowEmployee";
import empleado from "./Empleado";
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
      search: "",
      type: null,
      checkbox1: false,
      dialog: false,
      idM:"",
      editar: this.editarFresh(),
      // ite: "",
      titleAlerta: "",
      dialog2: false,
      headers: [
        { text: "Código", value: "codigo" },
        { text: "Nombres", value: "nombre" },
        { text: "Apellidos", value: "apellido" },
        { text: "Cargo", value: "cargo" },
        { text: "Direción", value: "direccion" },
        { text: "Ciudad", value: "ciudadNombre" },
        { text: "Teléfono", value: "telefono" },
        { text: "Email", value: "email" },
        { text: "Estado", value: "estado" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiCheck,
        mdiClose
      }
    };
  },
  mounted () {
      this.$store.dispatch("loadPersonalOn");
      this.$store.dispatch("loadCiudades");
  },
  computed: {
      ...mapState(["personal"])
  },
  components: {
      ShowEmployee,
      empleado,
  },
  methods: {
    onCheckboxChange(newValue, oldValue) {
    	console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.$store.dispatch("loadPersonaloff")
      }else{
        this.$store.dispatch("loadPersonalOn")
      }
    },
    activarDialogo(codigo) {
      console.log(codigo);
      this.idM = codigo;
      this.dialog = true;
    },
    limpiarFormulario(){
      this.dialog2 = false;
      this.personal.objetoPersonal = [],
      this.$store.state.personal.btnOn = true;
      console.log("ESTADO BTN", this.$store.state.personal.btnOn);
      this.$store.state.personal.etiqueta = "Guardar";
    },
    eliminarRegistro(idM) {
      this.$store.state.personal.usuario = this.$store.getters.UserLogueado;
      this.editar.codigo = idM;
      console.log(idM);
      this.$store
        .dispatch("deletePersonal", this.editar)
        .then(() => {
          //   this.$store.dispatch("loadModelosActivas");
          this.dialog = false; 
          this.titleAlerta = "Se há 'eliminado' correctamente el registro";
          this.$store.dispatch("setmessage", this.titleAlerta)
          this.showAlert("success");
        })
        .catch(err => {
          this.dialog = false;
          this.titleAlerta =
            "Ocurrió un error al tratar de 'eliminar' el registro";
          this.showAlert("error");
        });
    },
    editarFresh(){
      return{
        codigo: "",
      }
    },
    editItem(item) {
      this.$store.state.personal.etiqueta = "Editar";
      this.ite = item;
      // console.log(this.ite, item);
      this.$store.dispatch("getPersonal", this.ite);
      this.$store.dispatch("getBTN", false);
      this.dialog2 = true;
    },
    showAlert(type) {
      this.type = type;

      let timer = this.showAlert.timer;
      if (timer) {
        clearTimeout(timer);
      }
      this.showAlert.timer = setTimeout(() => {
        this.type = null;
      }, 3000);

      this.elapse = 1;
      let t = this.showAlert.t;
      if (t) {
        clearInterval(t);
      }

      this.showAlert.t = setInterval(() => {
        if (this.elapse === 3) {
          this.elapse = 0;
          clearInterval(this.showAlert.t);
        } else {
          this.elapse++;
        }
      }, 1000);
    },
  },
};
</script>