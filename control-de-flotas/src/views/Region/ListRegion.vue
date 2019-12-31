<template>
  <v-container>
    <v-alert :color="type" v-if="type">{{titleAlerta}}</v-alert>
    <h1>Regiones</h1>
    <RegionShow />
    <v-col>
      <v-data-table
        md="4"
        :headers="headers"
        :items="region.regiones"
        :items-per-page="5"
        class="elevation-1"
      >
        <template v-slot:item.estado="{ item }">
          <v-chip>{{item.estado==1 ? 'Activo' : 'Inactivo'}}</v-chip>
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn text rounded>
            <v-icon small class="mr-2" @click="editItem(item)">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn text rounded>
            <v-icon small @click="activarDialogo(item.codigo)">{{ icons.mdiDelete }}</v-icon>
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
            <p>Podrá cambiar esto, siempre</p>
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
            <v-toolbar-title>Editar Registro</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items>
              <v-btn dark text @click="dialog2 = false">Cancelar</v-btn>
            </v-toolbar-items>
          </v-toolbar>
          <v-list three-line subheader>
            <v-subheader>General</v-subheader>
            <v-container>
              <v-form @submit.prevent="editarRegistro">
                <v-text-field
                  minlength="1"
                  maxlength="1"
                  autofocus
                  v-model="edit.codigo"
                  required
                  disabled
                  label="Código"
                  type="text"
                ></v-text-field>
                <!-- <v-alert
                  type="error"
                  :value="alert"
                  transition="scale-transition"
                >Región ya está en uso</v-alert> -->

                <v-text-field
                  v-model="edit.descripcion"
                  :rules="descripcionRules"
                  required
                  label="Descripción"
                  type="text"
                ></v-text-field>

                <v-checkbox
                  v-model="edit.estado"
                  :rules="estadoRules"
                  required
                  input-value="true"
                  value
                  label="Activo"
                ></v-checkbox>

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
import RegionShow from "./RegionShow";
import { mdiAccount, mdiPencil, mdiShareVariant, mdiDelete } from "@mdi/js";
import { mapState } from "vuex";
export default {
  // name: "listRegion",
  data() {
    return {
      dialog: false,
      edit: this.editFreshItem(),
      dialog2: false,
      ite: "",
      titleAlerta: "",
      type: "",
      elapse: null,
      headers: [
        { text: "Código", value: "codigo" },
        { text: "Descripción", value: "descripcion" },
        { text: "Estado", value: "estado" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete
      },
      valid: false,
      codigoRules: [
        v => !!v || "Código es requerido",
        v => v.length <= 1 || "Código sólo puede tener 1 digito",
      ],
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"]
    };
  },
  mounted() {
    this.$store.dispatch("loadRegiones");
  },
  computed: {
    regionesActivas() {
      return $store.getters.regionesActivas;
    },
    ...mapState(["region"])
  },
  components: {
    RegionShow
  },
  methods: {
    activarDialogo(codigo) {
      console.log(codigo);
      this.idM = codigo;
      this.dialog = true;
    },
    editItem(item) {
      this.ite = item;
      console.log(this.ite, item);
      this.dialog2 = true;
      this.edit.codigo = item.codigo;
      this.edit.descripcion = item.descripcion;
      this.edit.estado = item.estado;
    },
    editFreshItem() {
      return {
        codigo: "",
        descripciones: "",
        estado: "",
      }
    },
    editarRegistro() {
      this.$store.state.region.usuario = this.$store.getters.UserLogueado;
      this.$store
        .dispatch("updateRegion", this.edit)
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
          this.showAlert("error");
        });
    },
    eliminarRegistro(idM) {
      console.log(idM);
      this.edit.codigo = idM;
      this.$store.state.region.usuario = this.$store.getters.UserLogueado;
      this.$store
        .dispatch("deleteRegion", this.edit)
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