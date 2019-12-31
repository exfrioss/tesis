<template>
  <v-container>
    <v-container>
      <v-col cols="12" md="12">
        <v-autocomplete
          autofocus
          v-model="pedidoCliente.cliente.codigo"
          :items="cliente.clientes"
          :filter="customFilter"
          item-text="nombre"
          label="Cliente"
          item-value="codigo"
        >
          <template v-slot:item="{ item }">{{item.codigo}} - {{item.nombre}}</template>
        </v-autocomplete>
      </v-col>
      <v-row>
        <v-col cols="12" sm="6" md="4">
          <v-menu
            ref="menu"
            v-model="menu"
            disabled
            :close-on-content-click="false"
            :return-value.sync="fechaP"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field readonly disabled v-model="fechaP" label="Fecha Pedido" v-on="on"></v-text-field>
            </template>
            <v-date-picker locale="Py" v-model="fechaP" no-title scrollable>
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
              <v-btn text color="primary" @click="$refs.menu.save(fechaP)">OK</v-btn>
            </v-date-picker>
          </v-menu>
        </v-col>

        <v-col>
          <v-text-field
            v-model="pedidoCliente.servicio.descripcion"
            readonly
            disabled
            label="Servicio"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-menu
            ref="menu2"
            v-model="menu2"
            :close-on-content-click="false"
            :return-value.sync="fechaE"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field v-model="fechaE" label="Fecha Entrega" v-on="on"></v-text-field>
            </template>
            <v-date-picker locale="Py" v-model="fechaE" no-title scrollable>
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu2 = false">Cancel</v-btn>
              <v-btn text color="primary" @click="$refs.menu2.save(fechaE)">OK</v-btn>
            </v-date-picker>
          </v-menu>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-text-field
            v-model="pedidoCliente.pesoI"
            @keyup="calcularTotal()"
            label="Peso inicial del Producto a transportar"
          ></v-text-field>
        </v-col>
        <v-col>
          <v-text-field v-model="pedidoCliente.pesoF" label="Peso final"></v-text-field>
        </v-col>
        <v-col>
          <v-text-field v-model="pedidoCliente.rango" label="Rango"></v-text-field>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-text-field
            v-model="pedidoCliente.servicio.precio"
            disabled
            readonly
            label="Precio por Kg"
          ></v-text-field>
        </v-col>
        <v-col>
          <v-text-field v-model="pedidoCliente.total" label="Total" disabled readonly></v-text-field>
        </v-col>
      </v-row>
    </v-container>
    <v-container>
      <v-row>
        <v-col cols="12" md="2">
          <v-btn @click="insertDatos">Guardar Pedido</v-btn>
        </v-col>
        <v-col cols="12" md="2">
          <v-btn color="error" to="serviciosCliente">Cancelar Pedido</v-btn>
        </v-col>
      </v-row>
    </v-container>
  </v-container>
</template>

<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      valid: false,
      menu: false,
      modal: false,
      fechaP: new Date().toISOString().substr(0, 10),
      menu2: false,
      fechaE: new Date().toISOString().substr(0, 10),
      insert: []
    };
  },
  mounted () {
    this.$store.dispatch("loadClienteON");
    this.$store.dispatch("loadPersonalbyemail", this.$store.getters.UserLogueado);
  },
  computed: {
    ...mapState(["pedidoCliente", "cliente"]),
    userLogueado(){
      console.log(this.$store.getters.UserLogueado)
      return this.$store.getters.UserLogueado
  }
  },
  methods: {
    customFilter(item, queryText, itemText) {
      const textOne = item.codigo.toLowerCase();
      const textTwo = item.email.toLowerCase();
      const textThree = item.nombre.toLowerCase();
      const textFour = item.apellido.toLowerCase();
      const textFive = item.telefono.toLowerCase();
      const searchText = queryText.toLowerCase();

      return (
        textOne.indexOf(searchText) > -1 ||
        textTwo.indexOf(searchText) > -1 ||
        textThree.indexOf(searchText) > -1 ||
        textFour.indexOf(searchText) > -1 ||
        textFive.indexOf(searchText) > -1
      );
    },
    calcularTotal(){
      var ntotal = parseFloat(this.pedidoCliente.servicio.precio) * parseFloat(this.pedidoCliente.pesoI);
      console.log("precio: ", this.pedidoCliente.servicio.precio, "Peso: ",this.pedidoCliente.pesoI, "total: ", ntotal);
      this.$store.dispatch("calcularTotal", ntotal)
    },
    insertDatosFresh(){
      console.log(this.fechaP)
      return {
        fechaP: this.fechaP,
        codCliente: this.pedidoCliente.cliente.codigo,
        idEmpleado: this.userLogueado,
        fechaE: this.fechaE,
        codServicio: this.pedidoCliente.servicio.codigo,
        precio: this.pedidoCliente.servicio.precio,
        pesoI: this.pedidoCliente.pesoI,
        pesoF: this.pedidoCliente.pesoF,
        subtotal: this.pedidoCliente.total,
        rango: this.pedidoCliente.rango
      }
    },
    insertDatos(){
      this.insert = this.insertDatosFresh();
      console.log(this.insert);
      this.$store.dispatch("insertPedidoCliente", this.insert).then(() => {
        this.$store.dispatch("loadPedidosPendienteByCliente", this.pedidoCliente.cliente.codCliente);
        this.pedidoCliente.show = true;
        this.$router.push('serviciosCliente').then(() => {
          console.log("goodman")
        }).catch((err) => {
          
        });
      }).catch((err) => {
        
      });
    }

  }
};
</script>

<style lang="scss" scoped>
</style>