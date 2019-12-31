<template>
  <v-container>
    <v-card>
      <v-alert :color="type" v-if="type">{{titleAlerta}}</v-alert>
      <!-- <ShowCiudad /> -->
      <v-card-title>
        Lista de Compras&nbsp&nbsp&nbsp&nbsp
        <v-checkbox v-model="checkbox1" @change="onCheckboxChange" label="Anulados:"></v-checkbox>
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-data-table :headers="headers" :items="compras.compra" :search="search">
        <template v-slot:item.estado="{ item }">
          <v-icon>{{item.estado==1 ? icons.mdiCheck : icons.mdiClose}}</v-icon>
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn @click="editItem(item)" text rounded>
            <v-icon class="mr-2">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn @click="activarDialogo(item.codigo)" text rounded>
            <v-icon>{{ icons.mdiDelete }}</v-icon>
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
              <v-btn icon dark @click="dialog2 = false">
                <v-icon>mdi-close</v-icon>
              </v-btn>
              <v-toolbar-title>Editar Registro</v-toolbar-title>
              <v-spacer></v-spacer>
              <v-toolbar-items>
                <v-btn dark text @click="dialog2 = false">Cancelar</v-btn>
              </v-toolbar-items>
            </v-toolbar>
            <v-list three-line subheader>
              <v-subheader>General</v-subheader>
              <v-container>
                <!-- Aquí irá algo -->
              </v-container>
            </v-list>
          </v-card>
        </v-dialog>
      </v-row>
    </v-card>
  </v-container>
</template>

<script>
// import ShowCiudad from "./ShowCiudad";
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
      checkbox1: false,
      checkbox2: false,
      valid: true,
      edit: this.editFreshItem(),
      dialog2: false,
      dialog: false,
      idM: "",
      type: null,
      elapse: null,
      titleAlerta: "",
      search: "",
      headers: [
        { text: "Código", value: "codigo" },
        { text: "Empresa", value:"razonSocial"},
        { text: "Contacto", value: "contactoProvedor" },
        { text: "Fecha Pedido", value:"sFechaPedido"},
        { text: "Fecha Recibido", value: "fechaString" },
        { text: "Encargado Compra", value:"aPersonal"},
        { text: "Encargado Pedido", value:"aPersonalP"},
        { text: "Codigo Pedido", value: "idpedido"},
        { text: "Total pagado", value:"total"},
        { text: "Total a pagar", value:"totalPedido"},
        { text: "Anulado?", value: "anulado" },
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
  mounted() {
    this.$store.dispatch("loadCompras");
  },
  computed: {
    ...mapState(["compras"])
  },
  components: {
    // ShowCiudad
  },
  methods: {
    editItem(item) {
      this.ite = item;
      console.log(this.ite, item);
      this.dialog2 = true;
    //   this.edit.codigo = item.codigo;
    //   this.edit.descripcion = item.descripcion;
    //   this.edit.departamento = item.departamento;
    //   this.edit.estado = item.estado;
    },
    editFreshItem() {
      return {
        codigo: "",
        descripciones: "",
        departamento: "",
        estado: ""
      };
    },
    editarRegistro() {
      conosle.log("Aquí irá algo")
    },
    activarDialogo(codigo) {
      console.log(codigo);
      this.idM = codigo;
      this.dialog = true;
    },
    eliminarRegistro(idM) {
      console.log(idM);
      this.$store.dispatch("anularCompras", idM).then(() => {
          this.dialog = false
          this.titleAlerta = "Se há 'eliminado' correctamente el registro";
          this.showAlert("success");
      }).catch((err) => {
          this.dialog = false;
          this.titleAlerta =
            "Ocurrió un error al tratar de 'eliminar' el registro";
          this.showAlert("error"); 
      });
    },
    onCheckboxChange(newValue, oldValue) {
    	console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.$store.dispatch("loadComprasAnulados")
      }else{
        this.$store.dispatch("loadCompras")
      }
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
    }
  }
};
</script>