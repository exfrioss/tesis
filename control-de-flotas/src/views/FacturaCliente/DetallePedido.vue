<template>
  <v-container>
      <div>
          <v-alert :color="type"  v-if="type">{{message}}</v-alert>
      </div>
      <v-row>
        <v-col>
          <v-card flat class="rounded-card" max-width="800">
            <br />
            <h1 align="center">Empresa Transportadora de granos</h1>
            <h1 align="center">TLO (Transportadora La Oventense)</h1>
            <br />
            <p align="center">
              Empresa a cargo de servicios de transporte de productos de granos
            </p>
            <br />
            <p align="center">
              Coronel Oviedo Departamento de Caaguazu, RUTA KM7
            </p>
            <h5 align="center">Telefono (0996) 242 996</h5>
            <br />
            <h5 align="center">Correo: transportadora@granos.com</h5>
            <br />
            <h5 align="center">CORONEL OVIEDO - PARAGUAY</h5>
          </v-card>
        </v-col>
        <v-col>
          <v-card flat class="rounded-card" max-width="800">
            <v-text-field v-model="ajusteFactura.talonario.timbrado" disabled label="Número Timbrado"></v-text-field>
            <v-row>
              <v-col cols="12" md="6" sm="6">
                <v-text-field
                  v-model="ajusteFactura.talonario.fechaInicioVigencia"
                  disabled
                  label="Fecha inicio vigencia"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="6" sm="6">
                <v-text-field
                  disabled
                  v-model="ajusteFactura.talonario.fechaFinVigencia"
                  label="Fecha fin vigencia"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-text-field disabled label="RUC" v-model="ajusteFactura.talonario.ruc"></v-text-field>
            <h1 align="center">FACTURA</h1>
            <v-text-field v-model="ajusteFactura.talonario.nroFactura" disabled label="Número Factura"></v-text-field>
          </v-card>
        </v-col>
      </v-row>
      <br />
      <v-row>
        <v-col cols="12" sm="6" md="8">
          <v-menu
            ref="menu"
            v-model="menu"
            :close-on-content-click="false"
            :return-value.sync="insert.fechaE"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                :prepend-icon="icons.mdiCalendar"
                v-model="insert.fechaE"
                label="Fecha de Emisión"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              locale="Py"
              v-model="insert.fechaE"
              no-title
              scrollable
            >
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
              <v-btn
                text
                color="primary"
                @click="$refs.menu.save(insert.fechaE)"
                >OK</v-btn
              >
            </v-date-picker>
          </v-menu>
        </v-col>
        <v-col cols="12" md="2">
          <br />
          <p class="text-md-left">Condición de venta</p>
        </v-col>
        <v-col cols="12" md="1">
          <v-checkbox
            v-model="insert.contado"
            disabled
            label="Contado"
            required
            input-value="true"
            value
          ></v-checkbox>
        </v-col>
        <v-col cols="12" md="1">
          <v-checkbox
            v-model="insert.credito"
            disabled
            label="Crédito"
            required
            input-value="true"
            value
          ></v-checkbox>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" md="8">
          <v-text-field disabled v-model="pedidoCliente.cabecera.ruc" label="Ruc:"></v-text-field>
        </v-col>
        <v-col>
          <v-text-field v-model="pedidoCliente.cabecera.personal" disabled label="Chofer:"></v-text-field>
        </v-col>
      </v-row>
            <v-text-field v-model="pedidoCliente.cabecera.cliente" disabled label="Nombre o Razón Social:"></v-text-field>
       <v-card-title>
      <v-spacer></v-spacer>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="pedidoCliente.detalle"
      :hide-default-footer="true"
    ></v-data-table>
    <v-row>
        <v-col cols="12" md="9">
            <v-text-field disabled label="TOTAL"></v-text-field>
        </v-col>
        <v-col>
            <v-text-field disabled label=" " v-model="pedidoCliente.detalle[0].precioIva10"></v-text-field>
        </v-col>
    </v-row>
    <v-row>
        <v-col>
        <v-text-field disabled label="LIQUIDACION DE IVA (5%)" v-model="pedidoCliente.detalle[0].iva5"></v-text-field>
    </v-col>
    <v-col>
        <v-text-field disabled label="(10%)" v-model="pedidoCliente.detalle[0].iva10"></v-text-field>
    </v-col>
    </v-row>
    <v-row>
        <v-col cols="12" md="2">
            <v-btn v-show="!this.facturaCliente.btnState" color="primary" @click="guardarFacturaCliente()">Guardar</v-btn>
        </v-col>
        <v-col cols="12" md="2">
            <v-btn v-show="this.facturaCliente.btnState" color="primary" @click="ImprimirFactura()">Imprimir Factura</v-btn>
        </v-col>
        <v-col cols="12" md="2">
            <v-btn color="error">Cancelar</v-btn>
        </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mdiCalendar } from "@mdi/js";
import { mapState } from 'vuex';
export default {
  data() {
    return {
      message: "",
      dialogo3: false,
      type: null,
      insert: this.insertRefresh(),
      menu: false,
      icons: {
        mdiCalendar
      },
      headers:[
          {text:"Cantidad (Kg)", value: "peso_inicial"},
          {text:"Servicio", value:"servicio"},
          {text:"Precio (kg)", value:"precio_unitario_servicio"},
          {text:"Exentas", value:"exentas"},
          {text:"5%", value:"precioIva5"},
          {text:"10%", value:"precioIva10"},
      ],
      search:""
    };
  },
  computed: {
      ...mapState(["ajusteFactura"]),
      ...mapState(["pedidoCliente", "facturaCliente"])
  },
  mounted () {
      this.$store.dispatch("getTheLastTalonarioActivo");
    //   this.$store.dispatch("loadListaAFacturar", this.$store.state.pedidoCliente.codPedido);
  },
  methods: {
      insertRefresh(){
          return {
              fechaE: new Date().toISOString().substr(0, 10),
              credito: false,
              contado: true,
              nrofactura: "",
              ci: "",
              usuario:"",
              chofer: "",
              total: "",
              idPedido: "",
              talonario: "",
              empleado: "",
              codServicio: "",
              cantidad: "",
              precio:"",
              pesoI: "",
              pesoF: "",
              subtotal: 0,
              tolerancia: "",
              iva5: 0,
              iva10: 0
          }
      },
      guardarFacturaCliente(){
          this.insert.nrofactura = this.ajusteFactura.talonario.nroFactura;
          this.insert.ci = this.pedidoCliente.cabecera.codCliente;
          this.insert.usuario = this.$store.getters.UserLogueado;
          this.insert.chofer = this.pedidoCliente.cabecera.chofer;
          this.insert.total = this.pedidoCliente.detalle[0].precioIva10;
          this.insert.idPedido = this.pedidoCliente.cabecera.codigoPedido;
          this.insert.talonario = this.ajusteFactura.talonario.cod;
          this.insert.codServicio = this.pedidoCliente.detalle[0].cod_servicio;
          this.insert.cantidad = this.pedidoCliente.detalle[0].cantidad;
          this.insert.precio = this.pedidoCliente.detalle[0].precio_unitario_servicio;
          this.insert.pesoI = this.pedidoCliente.detalle[0].peso_inicial;
          this.insert.pesoF = this.pedidoCliente.detalle[0].peso_final;
          this.insert.subtotal = this.pedidoCliente.detalle[0].subtotal;
          this.insert.tolerancia = this.pedidoCliente.detalle[0].tolerancia;
          this.insert.iva5 = this.pedidoCliente.detalle[0].iva5;
          this.insert.iva10 = this.pedidoCliente.detalle[0].iva10;
          console.log(this.insert);
          this.$store.dispatch("guardarFactura", this.insert).then(() => {
              this.facturaCliente.btnState = true;
              this.message = "Se ha registrado la Factura!!"
              this.showAlert("success");
          }).catch((err) => {
              this.message = "Error al registrar la factura!!"
              this.showAlert("error");
          });
      },
      ImprimirFactura(){
          dialogo3 = true;
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
    },  
  },
};
</script>

<style lang="scss">
.rounded-card {
  border-radius: 50px;
}
</style>
