<template>
  <div>
    <v-container>
      <showPedido/>
      <!-- <div v-for="i in personal.personal" :key="i.codigo"> -->
        <h1 v-show="false">Orden de compra a Proveedor: Funcionario encargado: {{ pedidoProveedor.idempleado = userLogueado}}</h1>
        <v-text-field
          disabled
          v-show="false"
          v-model="pedidoProveedor.idempleado"
          label="Codigo empleado"
          required
        ></v-text-field>
      <!-- </div> -->
      <v-form v-model="valid">
        <v-container>
          <v-row>
            <v-col cols="12" sm="6" md="4">
              <v-menu
                ref="menu"
                v-model="menu"
                :close-on-content-click="false"
                :return-value.sync="pedidoProveedor.fechaP"
                transition="scale-transition"
                offset-y
                min-width="290px"
              >
                <template v-slot:activator="{ on }">
                  <v-text-field v-model="pedidoProveedor.fechaP" label="Fecha Pedido" v-on="on"></v-text-field>
                </template>
                <v-date-picker locale="Py" v-model="pedidoProveedor.fechaP" no-title scrollable>
                  <v-spacer></v-spacer>
                  <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                  <v-btn text color="primary" @click="$refs.menu.save(pedidoProveedor.fechaP)">OK</v-btn>
                </v-date-picker>
              </v-menu>
            </v-col>
            <v-col cols="12" md="4">
              <v-autocomplete
                autofocus
                v-model="pedidoProveedor.idproveedor"
                :items="proveedor.proveedor"
                :filter="customFilter"
                item-text="razonSocial"
                label="Proveedor"
                item-value="codigo"
              >
                <template v-slot:item="{ item }">{{item.codigo}} - {{item.razonSocial}}</template>
              </v-autocomplete>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
      <todoPedido></todoPedido>

      <v-container>
        <v-row>
          <v-col md="8">
            <v-text-field disabled readonly value="total:"></v-text-field>
          </v-col>
          <v-col md="4">
            <div v-show="false">{{this.pedidoProveedor.total = todopedido.total}}</div>
            <v-text-field disabled readonly v-model="this.pedidoProveedor.total"></v-text-field>
          </v-col>
        </v-row>
      </v-container>
      <v-container>
        <v-row>
          <v-col md="8">
            <v-text-field disabled readonly value="Item:"></v-text-field>
          </v-col>
          <v-col md="4">
            <v-text-field disabled readonly v-model="this.$store.state.todopedido.listToPedidoInsumo.length"></v-text-field>
          </v-col>
        </v-row>
        <v-btn @click="createPedido()">Guardar Pedido</v-btn>
      </v-container>
    </v-container>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";
import todoPedido from "./TodoPedidos";
import showPedido from './ShowPedido'
export default {
  components: {
    todoPedido,
    showPedido
  },
  data() {
    return {
      pedidoProveedor: this.addFreshPedido(),
      valid: false,
      menu: false,
      modal: false
    };
  },
  mounted() {
    this.$store.dispatch("loadProveedor");
    this.$store.dispatch("loadInsumos");
    this.$store.dispatch("loadPersonalbyemail", this.$store.getters.UserLogueado);
    this.getDetalleForTodoPedidos();
  },
  computed: {
    ...mapState(["proveedor", "insumo", "personal", "pedido", "todopedido"]),
    ...mapGetters(["perosnalByID"]),
    ...mapMutations(["SET_TOTAL"]),
    userLogueado(){
      console.log(this.$store.getters.UserLogueado)
      return this.$store.getters.UserLogueado
  }
  },
  methods: {
    customFilter(item, queryText, itemText) {
      const textOne = item.codigo.toLowerCase();
      const textTwo = item.razonSocial.toLowerCase();
      const textThree = item.telefono.toLowerCase();
      const searchText = queryText.toLowerCase();

      return (
        textOne.indexOf(searchText) > -1 ||
        textTwo.indexOf(searchText) > -1 ||
        textThree.indexOf(searchText) > -1
      );
    },
    getDetalleForTodoPedidos(){
      for (const key in this.$store.state.listToPedidoInsumo) {
        if (this.$store.state.listToPedidoInsumo.hasOwnProperty(key)) {
          const element = this.$store.state.listToPedidoInsumo[key];
          console.log("TodoPedido is here:", element.descripcion);
        }
      }
    },
    addFreshPedido() {
      return {
        fechaP: new Date().toISOString().substr(0, 10),
        total: 0,
        idproveedor: "",
        idempleado: "",
        usuario: ""
      };
    },
    createPedido() {
      this.pedidoProveedor.usuario = this.$store.getters.UserLogueado;
      //TAREAS PENDIENTES, MIENTRAS SE DISEÑA LA LISTA DE PEDIDOS E INTERFAZ DE COMPRAS
      this.$store
        .dispatch("createPedido", this.pedidoProveedor)
        .then(result => {
          console.log("Googd job", result);
          this.$store.dispatch("loadPedido").then(() => {
            this.$store
                .dispatch("createDetallePedido")
                .then(result => {
                  this.$router.push('/listPedido');
                  console.log(result);
                })
                .catch(err => {
                  console.error(err);
                });
          }).catch((err) => {
            console.log(err)
          });
        })
        .catch(err => {
          console.log(
            //alerta de error a configurarse, en el caso de no se haya registrado ni la cabecera
            "algo ha salido mal, aunque no tengo idea de qué debería pasar xD",
            err
          );
        });
    },
  }
};
</script>

<style lang="scss" scoped>
</style>