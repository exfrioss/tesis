<template>
  <v-container>
    <v-alert :color="type"  v-if="type">{{titleAlerta}}</v-alert>
    <!-- <b>{{elapse}}</b> -->
    <v-col cols="12" md="12">
      <navServicio />
      <v-card-title>
       Servicios &nbsp&nbsp&nbsp&nbsp
        <v-checkbox v-model="checkbox1" @change="onCheckboxChange" label="Eliminados:"></v-checkbox>
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-data-table
        md="4"
        :headers="headers"
        :items="servicio.servicios"
        :items-per-page="15"
        class="elevation-1"
        :search="search"
      >
        <template v-slot:item.estado="{ item }">
          <v-chip>{{item.estado==1 ? 'Activo' : 'Inactivo'}}</v-chip>
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn text rounded>
            <v-icon  class="mr-2" @click="editItem(item)">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn text rounded>
            <v-icon
              :disabled="checkbox1"
              
              @click="activarDialogoInsumo(item.codigo)"
            >{{ icons.mdiDatabasePlus }}</v-icon>
          </v-btn>
          <v-btn text rounded>
            <v-icon
              :disabled="checkbox1"
              
              @click="activarDialogo(item.codigo)"
            >{{ icons.mdiDelete }}</v-icon>
          </v-btn>
        </template>
      </v-data-table>
    </v-col>

    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="430">
        <v-card>
          <v-card-title class="headline">"Eliminar Registro"</v-card-title>
          <v-card-text>
            El registro no será eliminado de la base de datos,
            <p>pasará de estar "activo" a "inactivo".</p>
            <p>Podrá cambiar esto siempre </p>
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
            <v-toolbar-title>Editar Modelo</v-toolbar-title>
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
                  <v-col cols="12" md="2">
                    <v-text-field
                      v-model="edit.codigo"
                      disabled
                      v-show="true"
                      label="Codigo servicio"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="5">
                    <v-text-field v-model="edit.descripcion" autofocus label="Descripción"></v-text-field>
                  </v-col>
                  <v-col cols="12" md="5">
                    <v-autocomplete
                      :items="vehiculo.vehiculos"
                      item-text="tDescripcion"
                      item-value="codigoVehiculo"
                      v-model="edit.idVehiculo"
                      label="Vehiculo"
                    ></v-autocomplete>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12" md="6">
                    <v-autocomplete
                      :items="ciudad.ciudad"
                      item-text="descripcion"
                      item-value="codigo"
                      v-model="edit.idOrigen"
                      label="Ciudad de Origen"
                    ></v-autocomplete>
                  </v-col>
                  <v-col cols="12" md="6">
                    <v-autocomplete
                      :items="ciudad.ciudad"
                      item-value="codigo"
                      item-text="descripcion"
                      v-model="edit.idDestino"
                      label="Ciudad de Destino"
                    ></v-autocomplete>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12" md="6">
                    <v-text-field v-model="edit.origen" label="Lugar de Origen"></v-text-field>
                  </v-col>
                  <v-col cols="12" md="6">
                    <v-text-field v-model="edit.destino" label="Lugar de Destino"></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12" md="6">
                    <v-text-field v-model="edit.precio" label="Precio del servicio" type="number"></v-text-field>
                  </v-col>
                  <v-col cols="12" md="6">
                    <v-select
                      v-model="edit.iva"
                      :items="ivas"
                      :rules="[v => !!v || 'Iva es requerido']"
                      label="Iva"
                      required
                    ></v-select>
                  </v-col>
                </v-row>
                <v-checkbox
                  v-model="edit.estado"
                  required
                  input-value="true"
                  value
                  label="Activo"
                ></v-checkbox>
                <div class="my-2">
                  <v-btn depressed color="primary" type="submit">Guardar</v-btn>
                </div>
              </v-form>
            </v-container>
          </v-list>
        </v-card>
      </v-dialog>
    </v-row>
  </v-container>
</template>
<script>
import navServicio from "./NavServicio";
import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiCalendar,
  mdiDetails,
  mdiDatabasePlus
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
      ivas: ["0", "5", "10"],
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"],
      search: "",
      headers: [
        { text: "Código", value: "codigo" },
        { text: "Descripción", value: "descripcion" },
        { text: "Lugar de Carga", value: "origen" },
        { text: "Lugar de Destino", value: "destino" },
        { text: "Precio de transporte", value: "precio"},
        { text: "Estado", value: "estado" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiCalendar,
        mdiDetails,
        mdiDatabasePlus
      },
      menu: false,
      menu2: false
    };
  },
  mounted() {
    this.$store.dispatch("loadServiciosActivos");
    this.$store.dispatch("loadCiudades");
    this.$store.dispatch("loadPersonal");
    this.$store.dispatch("loadVehiculosActivos");
  },
  computed: {
    ...mapState(["personal", "vehiculo", "ciudad", "servicio"])
  },
  components: {
    navServicio
  },
  methods: {
    activarDialogo(codigo) {
      console.log(codigo);
      this.idM = codigo;
      this.dialog = true;
    },
    activarDialogoInsumo(codigo) {
      this.servicio.idServicio = codigo;
      this.$router.push("/agregarInsumos").then(() => {}).catch((err) => {
        console.log(err)
      });
    },
    eliminarRegistro(idM) {
      console.log(idM);
      this.$store
        .dispatch("deleteServicio", idM)
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
      this.edit.codigo = item.codigo;
      this.edit.descripcion = item.descripcion;
      this.edit.idVehiculo = item.idVehiculo;
      this.edit.origen = item.origen;
      this.edit.destino = item.destino;
      this.edit.idDestino = item.idDestino;
      this.edit.idOrigen = item.idOrigen;
      this.edit.precio = item.precio;
      this.edit.estado = item.estado;
      this.edit.iva = item.iva;
    },
    editFreshItem() {
      return {
        codigo: "",
        descripciones: "",
        idVehiculo: "",
        origen: "",
        destino: "",
        idOrigen: "",
        idDestino: "",
        precio: "",
        iva:"",
        estado: true
      };
    },
    editarRegistro() {
      this.$store
        .dispatch("updateServicio", this.edit)
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
        this.$store.dispatch("loadServiciosInActivos");
      } else {
        this.$store.dispatch("loadServiciosActivos");
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
    }
  }
};
</script>