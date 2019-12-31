<template>
  <v-container>
    <v-card>
      <showPedido />
      <br />
      <v-card-title>
        Pedidos &nbsp&nbsp&nbsp&nbsp
        <v-checkbox v-model="checkbox1" @change="onCheckboxChange" label="Anulados:"></v-checkbox> &nbsp&nbsp
        <v-checkbox v-model="checkbox2" @change="onCheckboxChange1" label="Recibidos:"></v-checkbox>
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-alert :color="type" v-if="type">{{mensageAlerta}}</v-alert>
      <v-data-table :headers="headers" :items="pedido.pedido" :search="search">
        <template
          hide-default-header:True
          v-slot:item.idproveedor="{ item }"
        >{{item.personalN}} {{item.personalA}}</template>
        <template v-slot:item.estado="{ item }">
          <v-icon>{{item.estado==1 ? icons.mdiCheck : icons.mdiTimerSand}}</v-icon>
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn text rounded @click="getPedidos(item.codigo, item.idproveedor)">
            <v-icon small class="mr-2">{{icons.mdiDetails}}</v-icon>
          </v-btn>
          <p v-show="false">{{idP = item.codigo}}</p>
          <v-btn :disabled="checkbox1 || checkbox2" text rounded @click="dialog2 = true">
            <v-icon small>{{ icons.mdiNull }}</v-icon>
          </v-btn>
        </template>
      </v-data-table>
      <v-dialog
        v-model="dialog"
        fullscreen
        hide-overlay
        transition="dialog-bottom-transition"
        scrollable
      >
        <v-card tile>
          <v-toolbar flat dark color="primary">
            <v-btn icon dark @click="dialog = false">
              <v-icon>mdi-close</v-icon>
            </v-btn>
            <v-toolbar-title>Opciones de Pedido</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items>
              <v-btn dark text @click="limpiar">Cancelar</v-btn>
            </v-toolbar-items>
          </v-toolbar>
          <br />
          <v-alert :color="type" v-if="type">{{mensageAlerta}}</v-alert>
          <v-card-text>
            <v-btn color="primary" class="ma-2" @click="guardarCompras()">Guardar Compra</v-btn>
            <v-tooltip right>
              <template v-slot:activator="{ on }">
                <v-btn class="ma-2" v-on="on" @click="anularPedido(idP)">Anular Pedido</v-btn>
              </template>
              Anular Pedidos
            </v-tooltip>
            <v-list three-line subheader>
              <cabeceraCompra autofocus />
              <todoDetalleCompra />
            </v-list>
          </v-card-text>
          <div style="flex: 1 1 auto;"></div>
        </v-card>
      </v-dialog>

      <v-row justify="center">
        <v-dialog v-model="dialog2" persistent max-width="420">
          <v-card>
            <v-card-title class="headline">Quieres anular el pedido?</v-card-title>
            <v-card-text>Una vez anulado el pedido: <p>1) Ya no se podrá revertir la operación.</p> 
            <p>2) Ya no podrás factura el pedido anulado</p> <p> 3) Deberás realizar un nuevo pedido para facturar</p> </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="dialog2 = false">Cancelar</v-btn>
              <v-btn color="green darken-1" text @click="anularPedido(idP)">Anular</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-row>

    </v-card>
  </v-container>
</template>

<script>
import datePicker from "../DatePicker/DatePicker";
import showPedido from "./ShowPedido";
import todoDetalleCompra from "../Compra/TodoDetalleCompra";
import cabeceraCompra from "../Compra/CabeceraCompra";
import createPedido from "./CreatePedidos";
import { mapState } from "vuex";
import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiTimerSand,
  mdiDelete,
  mdiFormatListBulletedSquare,
  mdiCheck,
  mdiClose,
  mdiDetails,
  mdiNull,
  mdiMinusCircle
} from "@mdi/js";
export default {
  data() {
    return {
      idP: "",
      info: "info",
      type:null,
      activarAlert: false,
      mensageAlerta:
        "Primero debés de anular la factura para, poder realizar algunas acciones!!!",
      pedidobyId: [],
      dialog: false,
      dialog2: false,
      checkbox1: false,
      checkbox2: false,
      anular: this.anularFresh(),
      search: "",
      headers: [
        { text: "Código Pedido", value: "codigo" },
        { text: "Proveedor", value: "proveedor" },
        { text: "Total a Pagar", value: "total" },
        { text: "Anulado?", value: "anulado" },
        { text: "Estado", value: "estado" },
        { text: "Encargado", value: "idproveedor" },
        { text: "Fecha Pedido", value: "fechaP" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiCheck,
        mdiClose,
        mdiDetails,
        mdiNull,
        mdiTimerSand,
        mdiMinusCircle
      }
    };
  },
  mounted() {
    this.$store.dispatch("loadPedido");
    this.$store.dispatch("loadComprasPedido");
  },
  computed: {
    ...mapState(["pedido", "compras", "todopedido"])
  },
  components: {
    datePicker,
    todoDetalleCompra,
    createPedido,
    cabeceraCompra,
    showPedido
  },
  methods: {
    anularFresh(){
      return {
        usuario: "",
        codigo: ""
      }
    },
    limpiar(){
      this.dialog = false
      this.todopedido.total = ""
    },
    getPedidos(idPedido, idproveedor) {
      console.log(idproveedor, idPedido);
      this.dialog = true;
      this.$store.dispatch("pedidobyId", idPedido);
      this.$store.dispatch("getProveedorPorId", idproveedor);
      console.log(idPedido, idproveedor);
    },
    guardarCompras() {
      (this.pedidobyId = []),
        console.log(this.$store.state.pedido.pedidoById[0].detallePedido);
      this.pedidobyId.push({
        cabecera: this.$store.state.compras.cabecera,
        detalle: this.$store.state.pedido.pedidoById[0].detallePedido
      });
        // console.log("ESTO ES IMPORTANTE1", this.pedidobyId);
        // console.log("ESTO ES IMPORTANTE2", )
      if (this.pedidobyId[0].cabecera.numeroFactura == "") {
        console.log("Debés completar primero Numero fatura wey")
        this.mensageAlerta = "Debés completar primero Numero fatura wey";
        this.activarAlert = true;
      }else{
        this.activarAlert = false;
        this.$store.dispatch("guardarCompra", this.pedidobyId);
        this.$store.dispatch("loadPedido")
        this.dialog = false;
        this.info = "success";
        this.mensageAlerta = "Se ha registrado correctamente la hueva";
        this.activarAlert = true;
      }
      this.$store.dispatch("loadPedido");
    },
    anularPedido(idP) {
      this.anular.usuario = this.$store.getters.UserLogueado;
      this.anular.codigo = idP;
      console.log(idP);
      this.$store.dispatch("anularPedido", this.anular).then(() => {
        this.dialog2 = false;
        this.mensageAlerta = "Se há anulado correctamente el registro"
        this.showAlert("success");
      }).catch((err) => {
        this.dialog2 = false;
        this.mensageAlerta = "Error al tratar de anular el registro"
        this.showAlert("error");
      });
      // this.$store.dispatch("loadPedido")
      

    },
    onCheckboxChange(newValue, oldValue) {
      this.checkbox2 =false
    	console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.$store.dispatch("loadPedidosAnulados")
      }else{
        this.$store.dispatch("loadPedido")
      }
    },
    onCheckboxChange1(newValue, oldValue) {
      this.checkbox1 = false
    	console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.$store.dispatch("loadPedidosComprados")
      }else{
        this.$store.dispatch("loadPedido")
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