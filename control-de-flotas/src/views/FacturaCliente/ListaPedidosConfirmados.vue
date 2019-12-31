<template>
  <div>
    <v-alert :color="type" v-if="type">{{ pedidoCliente.message }}</v-alert>
    <v-card>
      <v-card-title>
        Facturar Pedidos Clientes
        <v-btn text to="/listCliente">
          <v-icon>{{ icons.mdiKeyboardBackspace }}</v-icon
          >Atrás
        </v-btn>
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="pedidoCliente.pedidosConfirmados"
        :search="search"
      >
        <template v-slot:item.action="{ item }">
          <v-btn @click="dialogo(item.codigoPedido)"
            ><v-icon>{{ icons.mdiTableRowRemove }}</v-icon></v-btn
          >
          <v-btn
            color="primary"
            class="ma-2"
            dark
            @click="dialogoChofer(item.codigoPedido)"
            ><v-icon>{{ icons.mdiTruckDelivery }}</v-icon></v-btn
          >
          <v-btn @click="dialogoFactura(item.codigoPedido)"
            ><v-icon>{{ icons.mdiTruckCheck }}</v-icon></v-btn
          >
        </template>
      </v-data-table>
    </v-card>

    <v-dialog v-model="dialog2" max-width="500px">
      <v-card>
        <v-card-title>
          Elegir Chofer
        </v-card-title>
        <v-card-text>
          <v-autocomplete
            v-model="update.idEmpleado"
            label="Chofer"
            :items="pedidoCliente.chofer"
            item-text="nombre"
            item-value="codigo"
          ></v-autocomplete>
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" text @click="addChoferN()">
            Guardar
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import { mapState } from "vuex";
import {
  mdiRvTruck,
  mdiTruckDelivery,
  mdiTableRowRemove,
  mdiTruckCheck,
  mdiKeyboardBackspace
} from "@mdi/js";
export default {
  data() {
    return {
      type: null,
      update: this.updatefresh(),
      dialog2: false,
      var: this.varfresh(),
      search: "",
      headers: [
        { text: "Ruc", value: "codCliente" },
        { text: "Cliente", value: "cliente" },
        { text: "Nro Pedido", value: "codigoPedido" },
        { text: "Servicio", value: "descripcion" },
        { text: "Fecha de Entrega", value: "fechaEntrega" },
        { text: "Acciones", value: "action" }
      ],
      icons: {
        mdiRvTruck,
        mdiTruckDelivery,
        mdiTableRowRemove,
        mdiTruckCheck,
        mdiKeyboardBackspace
      }
    };
  },
  computed: {
    ...mapState(["pedidoCliente"])
  },
  mounted() {
    console.log(this.$store.state.pedidoCliente.codcliente);
    if (this.pedidoCliente.codcliente > 0) {
      console.log("cargando ClienteById");
    } else {
      this.$store.dispatch("loadPedidosConfirmados");
    }
    this.$store.dispatch("chofer");
  },
  methods: {
    varfresh() {
      return {
        codigo: "",
        userLogueado: ""
      };
    },
    updatefresh() {
      return {
        idEmpleado: "",
        codPedido: "",
        usuario: ""
      };
    },
    dialogoChofer(codigo) {
      this.dialog2 = true;
      this.update.codPedido = codigo;
    },
    addChoferN() {
      this.dialog2 = false;
      // this.update.codPedido = codigo;
      this.update.usuario = this.$store.getters.UserLogueado;
      console.log(this.update);
      this.$store
        .dispatch("addChofer", this.update)
        .then(() => {
          this.showAlert("success");
        })
        .catch(err => {
          this.pedidoCliente.message = "Error al agregar chofer";
          this.showAlert("error");
        });
    },
    dialogo(codigo) {
      this.var.codigo = codigo;
      this.var.userLogueado = this.$store.getters.UserLogueado;
      console.log(codigo, this.var);
      this.$store
        .dispatch("anularPedidosConfirmados", this.var)
        .then(() => {
          console.log("good job");
        })
        .catch(err => {
          console.log(err);
        });
    },
    dialogoFactura(codigoPedido) {
      console.log(codigoPedido);
      this.pedidoCliente.codPedido = codigoPedido;
      this.$store
        .dispatch("loadListaAFacturar", codigoPedido)
        .then(() => {
          this.$router.push("/detallePedido");
        })
        .catch(err => {});
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

<style lang="scss" scoped></style>
