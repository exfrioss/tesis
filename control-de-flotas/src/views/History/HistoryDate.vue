<template>
  <div>
    <v-container>
      <v-row>
        <v-col cols="12" md="1">
      <v-btn text to="/listCliente">
        <v-icon>{{ icons.mdiKeyboardBackspace }}</v-icon
        >Atrás
      </v-btn>
        </v-col>
        <v-col cols="12" md="1">
          <v-checkbox
            v-model="grafico.anulado"
            @change="onCheckboxChange"
            label="Anulados:"
          ></v-checkbox> </v-col
        ><v-col>
          <v-checkbox
            v-model="grafico.esconfirmado"
            @change="onCheckboxChange1"
            label="Confirmados:"
          ></v-checkbox>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" sm="6" md="5">
          <v-menu
            ref="menu"
            v-model="menu"
            :close-on-content-click="false"
            :return-value.sync="grafico.fechaD"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                v-model="grafico.fechaD"
                label="Fecha Desde"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              locale="Py"
              v-model="grafico.fechaD"
              :max="grafico.fechaH"
              no-title
              scrollable
            >
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
              <v-btn
                text
                color="primary"
                @click="$refs.menu.save(grafico.fechaD)"
                >OK</v-btn
              >
            </v-date-picker>
          </v-menu>
        </v-col>
        <v-col cols="12" sm="6" md="5">
          <v-menu
            ref="menu2"
            v-model="menu2"
            :close-on-content-click="false"
            :return-value.sync="grafico.fechaH"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                v-model="grafico.fechaH"
                label="Fecha Hasta"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker
              locale="Py"
              v-model="grafico.fechaH"
              no-title
              scrollable
              :min="grafico.fechaD"
              :max="new Date().toISOString().substr(0, 10)"
            >
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu2 = false">Cancel</v-btn>
              <v-btn
                text
                color="primary"
                @click="$refs.menu2.save(grafico.fechaH)"
                >OK</v-btn
              >
            </v-date-picker>
          </v-menu>
        </v-col>

        <v-col>
          <v-btn v-show="this.grafico.esconfirmado" @click="setFiltro"
            >Filtrar</v-btn
          >
          <v-btn v-show="this.grafico.anulado" @click="setFiltroAnulado"
            >Filtrar Anulados</v-btn
          >
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import { mapState } from "vuex";
import {mdiKeyboardBackspace} from "@mdi/js"
export default {
  data() {
    return {
      sethistory: this.var(),
      modal: false,
      menu: false,
      menu2: false,
      icons: {
        mdiKeyboardBackspace
      }
    };
  },
  computed: {
    ...mapState(["grafico"])
  },
  methods: {
    var() {
      return {
        fechaD: "",
        fechaH: "",
        anulado: false,
        esconfirmado: true,
        codigoCliente: ""
      };
    },
    setFiltro() {
      this.sethistory.fechaD = this.grafico.fechaD;
      this.sethistory.fechaH = this.grafico.fechaH;
      this.sethistory.anulado = this.grafico.anulado;
      this.sethistory.esconfirmado = this.grafico.esconfirmado;
      this.sethistory.codigoCliente = this.grafico.codigoCliente;
      console.log(this.sethistory);
      this.$store.dispatch("loadCustomerActivity", this.sethistory);
    },
    setFiltroAnulados() {
      this.sethistory.fechaD = this.grafico.fechaD;
      this.sethistory.fechaH = this.grafico.fechaH;
      this.sethistory.anulado = this.grafico.anulado;
      this.sethistory.esconfirmado = this.grafico.esconfirmado;
      this.sethistory.codigoCliente = this.grafico.codigoCliente;
      console.log(this.sethistory);
      this.$store.dispatch("clienteActivityAnulados", this.sethistory);
    },
    onCheckboxChange(newValue, oldValue) {
      this.grafico.esconfirmado = false;
      console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.setFiltro();
      } else {
        this.setFiltro();
      }
    },
    onCheckboxChange1(newValue, oldValue) {
      this.grafico.anulado = false;
      console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.setFiltro();
      } else {
        this.setFiltro();
      }
    }
  }
};
</script>

<style lang="scss" scoped></style>
