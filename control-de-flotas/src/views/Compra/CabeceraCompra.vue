<template>
  <div>
    <v-container>
      <v-row>
        <v-col>
          <div v-for="item in personal.personal" :key="item.codigo">
            <p v-show="false">{{ compra.idFuncionario = item.nombre+item.apellido }}{{compra.selectpersonal=item.codigo}}</p>
            <v-text-field disabled label="Funcionario" v-model="compra.idFuncionario"></v-text-field>
          </div>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" md="4">
          <v-menu
            ref="menu"
            v-model="menu"
            :close-on-content-click="false"
            :return-value.sync="compra.fechaC"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field v-model="compra.fechaC" label="Fecha Compra" v-on="on"></v-text-field>
            </template>
            <v-date-picker locale="Py" v-model="compra.fechaC" no-title scrollable>
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
              <v-btn text color="primary" @click="$refs.menu.save(compra.fechaC)">OK</v-btn>
            </v-date-picker>
          </v-menu>
        </v-col>
        <v-col cols="12" md="4">
          <v-text-field autofocus v-model="compra.numeroFactura" ref="nrofactura" label="Número Factura" @keyup="getComprabyId()"></v-text-field>
          <v-alert v-show="alertaFactura" type="error">
            Número factura ya está en uso!!
          </v-alert>
        </v-col>
        <v-col>
          <div v-for="item in this.$store.state.proveedor.proveedorById" :key="item.codigo">
            <p v-show="false">{{compra.idProveedor = item.razonSocial}}{{compra.selectProveedor = item.codigo}}</p>
            <v-text-field disabled label="Proveedor" v-model="compra.idProveedor"></v-text-field>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
 
<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      alertaFactura: false,
      compra: this.addCompraFresh(),
      valid: false,
      menu: false,
      modal: false
    };
  },
  mounted() {
    this.$store.dispatch("loadPersonalbyID", 1);
    this.$store.dispatch("getCabeceraCompra", this.compra);
  },
  computed: {
    ...mapState(["personal", "proveedor", "compras"])
  }, 
  methods: {
    addCompraFresh() {
      return{
        numeroFactura: "",
        fechaC: new Date().toISOString().substr(0, 10),
        selectProveedor: "",
        selectpersonal: "",
        idFuncionario: "",
        idProveedor: ""
      }
    },
    getComprabyId(){
      console.log("Numero factura: ", this.compra.numeroFactura)
      this.$store.dispatch("loadcomprabyId", this.compra.numeroFactura);
      if (this.$store.state.compras.compraByID==this.compra.numeroFactura) {
       this.alertaFactura = true 
      }else{
        this.alertaFactura = false
      }
    }
  },
};
</script>

<style lang="scss" scoped>
</style>