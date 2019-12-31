<template>
  <v-container>
    <v-alert :color="type" value="true" v-if="type">{{titleAlerta}}</v-alert>
    <!-- <b>{{elapse}}</b> -->
    <v-container>
        <v-col cols="12" md="12">
      <navVehiculo/>
      <v-card-title>
        Vehiculo &nbsp&nbsp&nbsp&nbsp
        <v-checkbox v-model="checkbox1" @change="onCheckboxChange" label="Eliminados:"></v-checkbox>
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-data-table
        md="4"
        :headers="headers"
        :items="vehiculo.vehiculos"
        :items-per-page="15"
        class="elevation-1"
        :search="search"
      >
        <template v-slot:item.estadoVehiculo="{ item }">
          <v-chip>{{item.estadoVehiculo==1 ? 'Activo' : 'Inactivo'}}</v-chip>
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn text rounded>
            <v-icon small class="mr-2" @click="editItem(item)">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn text rounded>
            <v-icon
              :disabled="checkbox1"
              small
              @click="activarDialogo(item.codigoVehiculo)"
            >{{ icons.mdiDelete }}</v-icon>
          </v-btn>
        </template>
      </v-data-table>
    </v-col>
    </v-container>

    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="430">
        <v-card>
          <v-card-title class="headline">"Eliminar Registro"</v-card-title>
          <v-card-text>
            El registro no será eliminado de la base de datos,
            <p>pasará de estar "avtivo" a "inactivo".</p>
            <p>Podrá cambiar esto, siempre y cuando:</p>
            <p>El registro no esté asociado con otro registro activo</p>
            <p>Desea "eliminar" el registro?</p>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="red darken-1" text @click="dialog = false">Cancelar</v-btn>
            <v-btn color="green darken-1" text @click="eliminarRegistro(idM)">Eliminar</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>

    <v-row justify="center">
      <v-dialog v-model="dialog2" fullscreen hide-overlay transition="dialog-bottom-transition">
        <v-card>
          <v-toolbar dark color="primary">
            <v-btn icon dark @click="dialog2 = false">
              <v-icon>mdi-close</v-icon>
            </v-btn>
            <v-toolbar-title>Editar Vehiculo</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items>
              <v-btn dark text @click="dialog2 = false">Cancelar</v-btn>
            </v-toolbar-items>
          </v-toolbar>
          <v-list three-line subheader>
            <v-subheader>General</v-subheader>
            <v-container>
              <v-form @submit.prevent="editarRegistro">
                <v-row>
                  <v-col cols="12" md="4">
                    <v-text-field
                      disabled
                      v-model="edit.codigo"
                      required
                      label="Número de Chapa"
                      type="text"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4">
                    <v-text-field
                      v-model="edit.chasis"
                      :rules="descripcionRules"
                      required
                      label="Chasis"
                      type="text"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4">
                    <v-text-field
                      v-model="edit.nroMotor"
                      :rules="descripcionRules"
                      required
                      label="Número de motor"
                      type="text"
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12" md="6">
                      <v-autocomplete
                        v-model="edit.idtipo"
                        :items="tipo.tipos"
                        item-text="descripcion"
                        label="Tipo de vehiculo"
                        item-value="codigo"
                      >
                        <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
                      </v-autocomplete>
                  </v-col>
                    <v-col cols="12" md="6">
                      <v-autocomplete
                        v-model="edit.idmodelo"
                        :items="modelo.modelos"
                        item-text="descripcion"
                        label="Modelo vehiculo"
                        item-value="codigo"
                      >
                        <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
                      </v-autocomplete>
                    </v-col>
                </v-row>
                <v-row>
                    <v-col cols="12" md="6">
                      <v-autocomplete
                        v-model="edit.idmarca"
                        :items="marca.marcas"
                        item-text="descripcion"
                        label="Marca vehiculo"
                        item-value="codigo"
                      >
                        <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
                      </v-autocomplete>
                    </v-col>
                    <v-col cols="12" md="6">
                      <v-autocomplete
                        v-model="edit.idseguro"
                        :items="seguro.seguros"
                        item-text="descripcion"
                        label="Seguro vehiculo"
                        item-value="codigo"
                      >
                        <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
                      </v-autocomplete>
                    </v-col>
                </v-row>
                <v-container>
                  <v-row>
                    <v-checkbox
                      v-model="edit.estado"
                      :rules="estadoRules"
                      required
                      input-value="true"
                      value
                      label="Activo"
                    ></v-checkbox>
                  </v-row>
                </v-container>
                <v-btn type="submit">Guardar</v-btn>
              </v-form>
            </v-container>
          </v-list>
        </v-card>
      </v-dialog>
    </v-row>
  </v-container>
</template>
<script>
import navVehiculo from "./NavVehiculo";
import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiCalendar
} from "@mdi/js";
import { mapState } from "vuex";
export default {
  // name: "listRegion",
  data() {
    return {
      idM: "",
      ite: "",
      edit: this.editFreshItem(),
      dialog: false,
      dialog2: false,
      checkbox1: false,
      titleAlerta: "",
      type: null,
      elapse: null,
      activarAlerta: false,
      valid: true,
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"],
      search: "",
      headers: [
        { text: "Código", value: "codigoVehiculo" },
        { text: "Es Asociado?", value: "tIsAsociado" },
        { text: "Peso vehiculo", value: "tPesoNeto" },
        { text:"Longitud", value:"tipoLongitud"},
        { text: "Estado", value: "estadoVehiculo" },
        { text: "Modelo", value: "mDescripcion"},
        { text: "Año", value: "mAnio"},
        { text: "Tipo", value: "tDescripcion"},
        { text:"Marca", value:"maDescripcion"},
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiCalendar
      },
      menu: false,
      menu2: false
    };
  },
  mounted() {
    this.$store.dispatch("loadVehiculosActivos");
    this.$store.dispatch("loadMarcasActivas");
    this.$store.dispatch("loadModelosActivas");
    this.$store.dispatch("loadTiposActivos");
    this.$store.dispatch("loadSegurosActivos");
  },
  computed: {
    ...mapState(["tipo", "marca", "seguro", "vehiculo", "modelo"])
  },
  components: {
    navVehiculo
  },
  methods: {
    activarDialogo(codigo) {
      console.log(codigo);
      this.idM = codigo;
      this.dialog = true;
    },
    eliminarRegistro(idM) {
      console.log(idM);
      this.$store
        .dispatch("deleteVehiculo", idM)
        .then(() => {
          //   this.$store.dispatch("loadModelosActivas");
          this.dialog = false;
          this.titleAlerta = "Se há 'eliminado' correctamente el registro";
          this.showAlert("success");
        })
        .catch(err => {
          this.dialog = false;
          this.titleAlerta =
            "Ocurrió un error al tratar de 'eliminar' el registro";
          this.showAlert("error");
        });
    },
    editItem(item) {
      this.ite = item;
      console.log(this.ite, item);
      this.dialog2 = true;
      this.edit.codigo = item.codigoVehiculo;
      this.edit.chasis = item.chasis;
      this.edit.nroMotor = item.nroMotor;
      this.edit.idtipo = item.idtipo;
      this.edit.idmodelo = item.idmodelo;
      this.edit.idmarca = item.idmarca;
      this.edit.idseguro = item.idseguro;
      this.edit.estado = item.estadoVehiculo;
    },
    editFreshItem() {
      return {
        codigo: "",
        chasis: "",
        nroMotor: "",
        idtipo: "",
        idmodelo: "",
        idmarca: "",
        idseguro: "",
        estado: true
      };
    },
    editarRegistro() {
      this.$store
        .dispatch("updateVehiculo", this.edit)
        .then(() => {
          // this.$store.dispatch("loadModelosActivas");
          this.dialog2 = false;
          this.titleAlerta = "El registro ha sido actualizado correctamente";
          this.showAlert("success");
          this.checkbox1 = false;
        })
        .catch(err => {
          this.dialog2 = false;
          this.titleAlerta = "Error al tratar de actualizar el registro";
          this.showAlert("success");
        });
    },
    onCheckboxChange(newValue, oldValue) {
      if (newValue == true) {
        this.$store.dispatch("loadVehiculosInActivos");
      } else {
        this.$store.dispatch("loadVehiculosActivos");
      }
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
    customFilterInsumo(item, queryText, itemText) {
      const textOne = item.codigo.toLowerCase();
      const textTwo = item.descripcion.toLowerCase();
      const searchText = queryText.toLowerCase();

      return (
        textOne.indexOf(searchText) > -1 || textTwo.indexOf(searchText) > -1
      );
    },
    customFilterMarca(item, queryText, itemText) {
      const textOne1 = item.codigo.toLowerCase();
      const textTwo1 = item.descripcion.toLowerCase();
      const searchText1 = queryText.toLowerCase();

      return (
        textOne1.indexOf(searchText1) > -1 || textTwo1.indexOf(searchText1) > -1
      );
    },
  }
};
</script>