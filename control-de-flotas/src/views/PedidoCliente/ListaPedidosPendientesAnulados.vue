<template>
  <v-card class="mx-auto" max-width="1000" tile>
    <v-list shaped color="#1976D2">
      <v-subheader strong class="white--text text--lighten-1"
        >Pedidos Pendientes</v-subheader
      >
      <v-list-item-group v-model="item" color="primary">
        <v-list-item
          v-for="(item, i) in pedidoCliente.pedidosPendientesByCliente"
          :key="i"
        >
          <v-list-item-icon>
            <v-icon
              class="white--text text--lighten-1"
              v-text="icons.mdiCartArrowDown"
            ></v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title
              class="white--text text--lighten-1"
              v-text="item.cliente"
            ></v-list-item-title>
          </v-list-item-content>
          <v-list-item-content>
            <v-list-item-title
              class="white--text text--lighten-1"
              v-text="item.descripcion"
            ></v-list-item-title>
          </v-list-item-content>
          <v-list-item-content>
            <v-list-item-title
              class="white--text text--lighten-1"
              v-text="item.fechaEntrega"
            ></v-list-item-title>
          </v-list-item-content>
          <v-list-item-content>
            <v-list-tile-action>
              <v-btn small @click="dialogo(item.codigoPedido, item.codCliente)">x</v-btn>
            </v-list-tile-action>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
      <v-btn
        v-show="pedidoCliente.show"
        @click="confirmar()"
        class="black--text text--lighten-1"
        color="white"
        >Confirmar Pedido</v-btn
      >
    </v-list>


    <v-layout row justify-center>
    <v-dialog v-model="dialog" max-width="290">
      <v-card>
        <v-card-title class="headline">Anular Pedido</v-card-title>
        <v-card-text>Estas de seguro de ANULAR EL PEDIDO.</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="red" @click="dialog = false">Cancelar</v-btn>
          <v-btn color="primary" @click="anularPedido(codPedido, idCliente)">Anular</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-layout>



  </v-card>
</template>

<script>
import { mapState } from "vuex";
import { mdiCartArrowDown } from "@mdi/js";
export default {
  data() {
    return {
      value: this.valuerefresh(),
      codPedido: "",
      idCliente: "",
      dialog: false,
      anular: false,
      item: 1,
      icons: {
        mdiCartArrowDown
      },
      listaPeidos: []
    };
  },
  mounted() {
    this.$store
      .dispatch(
        "loadPedidosPendienteByCliente",
        this.pedidoCliente.cliente.codCliente
      )
      .then(() => {
        pedidoCliente.show = true;
      })
      .catch(err => {
        console.log(err);
      });
  },
  computed: {
    ...mapState(["pedidoCliente"])
  },
  methods: {
    confirmarfresh() {
      return {
        listPeidos: []
      };
    },
    valuerefresh(){
      return {
        usuario: "",
        idPedido: "",
        idCliente: "",
      }
    },
    confirmar() {
      this.pedidoCliente.usuario = this.$store.getters.UserLogueado;
      this.listaPeidos = this.pedidoCliente.pedidosPendientesByCliente;
      console.log("listaPedido", this.listaPeidos);
      this.$store.dispatch("confirmarPedidosCliente", this.listaPeidos);
    },
    dialogo(codigo, idCliente){
      this.dialog = true
      this.codPedido = codigo;
      this.idCliente = idCliente
      console.log(idCliente);
    },
    anularPedido(codigo, idCliente){
      this.dialog = false;
      this.value.usuario = this.$store.getters.UserLogueado;
      this.value.idPedido = codigo;
      this.value.idCliente = idCliente
      console.log(this.value)
      this.$store.dispatch("anularPedidoCliente", this.value);
  }
  },
};
</script>

<style lang="scss" scoped></style>
