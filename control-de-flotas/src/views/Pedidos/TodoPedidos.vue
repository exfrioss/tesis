<template>
  <div>
    <v-container>
      <v-form>
        <v-container>
          <v-row>
            <v-col cols="12" md="2">
              <v-text-field
                ref="insumoTextField"
                autofocus
                v-model="insumoToPedido.cantidad"
                label="Cantidad"
              ></v-text-field>
            </v-col>
            <v-col cols="12" md="8">
              <v-autocomplete
                @keyup.enter="addInsumosToPedidos()"
                @click="addInsumosToPedidos()"
                v-model="insumoToPedido.idProducto"
                :items="insumo.insumos"
                :filter="customFilterInsumo"
                item-text="descripcion"
                label="Productos"
                item-value="codigo"
              >
                <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
              </v-autocomplete>
            </v-col>
            <v-col cols="12" md="2">
              <v-btn @click="todoPedidoInsumo()">Add</v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-form>

      <v-simple-table fixed-header height="300px">
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-left">Código Insumo</th>
              <th class="text-left">Descricpción</th>
              <th class="text-left">Cantidad</th>
              <th class="text-left">Precio</th>
              <th class="text-left">Subtotal</th>
              <th class="text-left">Acción</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item in listInsumoToPedido" :key="item.codigo">
              <td>{{ item.codigo }}</td>
              <td>{{ item.descripcion }}</td>
              <td>{{ item.cantidad }}</td>
              <td>{{ item.precio }}</td>
              <td>{{ item.subtotal }}</td>
              <td>
                <v-btn @click="removeItem(item)" depressed small color="error">x</v-btn>
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </v-container>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      varTotal: 0,
      listInsumoToPedido: [],
      insumoToPedido: this.insumoTodPedidoFresh()
    };
  },
  mounted() {
    this.$store.dispatch("loadInsumos");
  },
  computed: {
    ...mapState(["insumo", "todopedido"])
  },
  methods: {
    customFilterInsumo(item, queryText, itemText) {
      const textOne = item.codigo.toLowerCase();
      const textTwo = item.descripcion.toLowerCase();
      const searchText = queryText.toLowerCase();

      return (
        textOne.indexOf(searchText) > -1 || textTwo.indexOf(searchText) > -1
      );
    },
    todoPedidoInsumo() {
      var idReplica;
      var itemOut;
      var cantidadElement;
      this.listInsumoToPedido.forEach(element => {
        console.log("Elementos", element.codigo, this.insumoToPedido.idProducto)
        if(this.insumoToPedido.idProducto==element.codigo) {
          console.log("Detectando replica");
          idReplica = element.codigo;
          itemOut = element;
          cantidadElement = element.cantidad;
        }
      })
      if (idReplica === this.insumoToPedido.idProducto) {
            console.log("Planeado estrategia, Replicas");
            var cantidadTotal =
                parseFloat(cantidadElement) + parseFloat(this.insumoToPedido.cantidad);
            var newSubT = parseFloat(cantidadTotal) * parseFloat(this.todopedido.precio);
            // this.insumoToPedido.total -= parseFloat(cantidadTotal) * parseFloat(this.todopedido.precio);
            var indexTarea = this.listInsumoToPedido.indexOf(itemOut);
            this.listInsumoToPedido.splice(indexTarea, 1);
            this.addReplicaa(cantidadTotal, newSubT);
      }else{
            console.log("Registros unicos")
            this.add();
          }
      this.setLisToPedidoInsumo(this.listInsumoToPedido);
    },
    add(){
      this.listInsumoToPedido.push({
          codigo: this.insumoToPedido.idProducto,
          descripcion: this.todopedido.descripcion,
          precio: this.todopedido.precio, 
          cantidad: this.todopedido.cantidad,
          subtotal: this.todopedido.subtotal
        });
      this.insumoToPedido = this.insumoTodPedidoFresh();
      this.$refs.insumoTextField.focus();
    },
    addReplicaa(cantidadTotal, newSubT){
      this.listInsumoToPedido.push({
          codigo: this.insumoToPedido.idProducto,
          descripcion: this.todopedido.descripcion,
          precio: this.todopedido.precio,
          cantidad: cantidadTotal,
          subtotal: newSubT
        });
      this.insumoToPedido = this.insumoTodPedidoFresh();
      this.$refs.insumoTextField.focus();
    },
    insumoTodPedidoFresh() {
      return {
        idProducto: "",
        descripcion: "",
        cantidad: "",
        subtotal: "",
        precio: "",
      };
    },
    addInsumosToPedidos() {
      // console.log(this.insumoToPedido)
      this.$store.dispatch("getInsumoByiD", this.insumoToPedido);
      // this.todoPedidoInsumo();
    },
    setLisToPedidoInsumo(listInsumoToPedido){
      this.$store.dispatch("getListToInsumo", listInsumoToPedido);
    },
    removeItem(item){
      this.listInsumoToPedido.splice(item, 1);
      this.$store.dispatch("getListToInsumo", this.listInsumoToPedido, item);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>