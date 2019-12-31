<template>
  <v-container>
    <v-container>
        <v-alert dismissible v-show="bored" type="success">{{servicio.message}}</v-alert>
      <v-autocomplete ref="focusinput" :items="servicio.servicios" item-text="descripcion" item-value="codigo" v-model="servicio.idServicio" label="Elegir Servicios" autofocus @keyup="ocultarAlerta"></v-autocomplete>
    </v-container>
    <todoPedido/>
    <v-container>
      <v-row>
        <v-col cols="12" md="8">
          <v-text-field label="Total" disabled readonly></v-text-field>
        </v-col>
        <v-col cols="12" md="4">
          <v-text-field v-model="todopedido.total" readonly disabled></v-text-field>
        </v-col>
      </v-row>
    </v-container>
    <v-container>
       <v-row>
          <v-col cols="12" md="2">
            <v-btn @click="verdatos">Guardar</v-btn>
        </v-col>
        <v-col cols="12" md="2">
            <v-btn to="/servicios" color="error">Cancelar</v-btn>
        </v-col>
       </v-row>
    </v-container>
  </v-container>
</template>

<script>
import {mapState} from "vuex";
import todoPedido from "../Pedidos/TodoPedidos"
export default {
    data() {
        return {
            insert: [],
            message: "",
            bored: false
        }
    },
    mounted () { 
        this.$store.dispatch("loadServiciosActivos")
        this.$store.dispatch("loadInsumos")
    },
    computed: {
        ...mapState(["servicio", "insumo", "todopedido"])
    },
    components: {
        todoPedido,
    },
    methods: {
        verdatos() {
            // this.servicio.idServicio = this.insert.codigoServicio;
            // console.log("Lista de insumos", this.todopedido.listToPedidoInsumo, "cod servicio: ", this.insert.codigoServicio);
            this.$store.dispatch("insertarDetalle", this.todopedido.listToPedidoInsumo).then(() => {
                this.bored = true
                // this.$ref.focusinput.focus();
                this.todopedido.listToPedidoInsumo = [];
                this.todopedido.insumoById = [];
                this.insert.codigoServicio = ""
                this.todopedido.total = 0
                this.$router.push('listServicio').then(() => {}).catch((err) => {
                    console.log(err)
                });
            }).catch((err) => {
                
            });
        },
        ocultarAlerta(){
            this.bored = false
        }
    },
};
</script>

<style lang="scss" scoped>
</style>