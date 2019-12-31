<template>
  <div>
    <v-container>

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
          <tbody v-for="item in pedido.pedidoById" :key="item.codigo">
            <p v-show="false">{{item.estado==0? estadoButton=false:estadoButton=true}}</p>
            <p v-show="false">{{listInsumoToPedido = item.detallePedido}}</p>
            <p v-show="false">{{varTotal = item.total}}</p>
            <tr v-for="insumo in listInsumoToPedido" :key="insumo.idinsumo">
              <td>{{ insumo.idinsumo }}</td>
              <td>{{ insumo.descripcion }}</td>
              <td>{{ insumo.cantidad }}</td>
              <td>{{ insumo.precioUnitario }}</td>
              <td>{{ insumo.subTotal }}</td>
              <td>
                <v-btn @click="removeItem(item)" depressed small color="error" :disabled="estadoButton">x</v-btn>
              </td>
            </tr>
          </tbody>
        </template> 
      </v-simple-table>
      <v-container>
        <v-row>
          <v-col cols="12" md="8">
            <v-text-field label="Total" disabled readonly></v-text-field>
          </v-col>
          <v-spacer></v-spacer>
          <v-col cols="12" md="4">
            <!-- <p v-show="false">{{this.total = todopedido.total}}</p> -->
            <v-text-field v-show="!show" v-model="varTotal"  disabled></v-text-field>
            <v-text-field v-show="show" v-model="total"  disabled></v-text-field>
          </v-col>
        </v-row>
      </v-container>
    </v-container>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      estadoButton: false,
      show: false,
      varTotal: 0,
      total: 0,
      listInsumoToPedido: [],
      insumoToPedido: this.insumoTodPedidoFresh()
    };
  },
  mounted() {
    // this.$store.dispatch("loadInsumos");

  },
  computed: {
    ...mapState(["todopedido", "pedido"])
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
      for (let index = 0; index < this.listInsumoToPedido.length; index++) {
        const element = this.listInsumoToPedido[index];
        console.log(element.codigo, this.insumoToPedido.idProducto, element);
        idReplica = element.codigo;
        itemOut = element;
        cantidadElement = element.cantidad;
      }
      if (idReplica === this.insumoToPedido.idProducto) {
        console.log("Planeado estrategia, Replicas");
        var cantidadTotal =
          parseFloat(cantidadElement) +
          parseFloat(this.insumoToPedido.cantidad);
        var newSubT =
          parseFloat(cantidadTotal) * parseFloat(this.todopedido.precio);
        var indexTarea = this.listInsumoToPedido.indexOf(itemOut);
        this.listInsumoToPedido.splice(indexTarea, 1);
        this.addReplicaa(cantidadTotal, newSubT);
      } else {
        console.log("Registros unicos");
        this.add();
      }
      this.setLisToPedidoInsumo(this.listInsumoToPedido);
    },
    add() {
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
    addReplicaa(cantidadTotal, newSubT) {
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
        precio: ""
      };
    },
    addInsumosToPedidos() {
      this.$store.dispatch("getInsumoByiD", this.insumoToPedido);
    },
    setLisToPedidoInsumo(listInsumoToPedido) {
     this.$store.dispatch("getListToInsumo", listInsumoToPedido);
    },
    removeItem(item) {
      this.show = true;
      this.listInsumoToPedido.splice(item, 1);
      this.$store.dispatch("getListToInsumo", this.listInsumoToPedido, item);
    }
  }
};
</script>