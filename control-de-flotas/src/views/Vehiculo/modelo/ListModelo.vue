<template>
  <v-container>
    <v-alert :color="type" value="true" v-if="type">{{titleAlerta}}</v-alert>
    <!-- <b>{{elapse}}</b> -->
    <v-col cols="12" md="12">
      <showModelo />
      <v-card-title>
        Modelo &nbsp&nbsp&nbsp&nbsp
        <v-checkbox v-model="checkbox1" @change="onCheckboxChange" label="Eliminados:"></v-checkbox>
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-data-table
        md="4"
        :headers="headers"
        :items="modelo.modelos"
        :items-per-page="15"
        class="elevation-1"
        :search="search"
      >
        <template v-slot:item.estado="{ item }">
          <v-chip>{{item.estado==1 ? 'Activo' : 'Inactivo'}}</v-chip>
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn text rounded>
            <v-icon small class="mr-2" @click="editItem(item)">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn text rounded>
            <v-icon :disabled="checkbox1" small @click="activarDialogo(item.codigo)">{{ icons.mdiDelete }}</v-icon>
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
            <v-toolbar-title>Editar Modelo</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items>
              <v-btn dark text @click="dialog2 = false">Cancelar</v-btn>
            </v-toolbar-items>
          </v-toolbar>
          <!-- <v-list three-line subheader>
          <v-list-item>
          </v-list-item>
        </v-list>
          <v-divider></v-divider>-->
          <v-list three-line subheader>
            <v-subheader>General</v-subheader>
            <v-container>
              <v-form @submit.prevent="editarRegistro()">
                <v-text-field
                  autofocus
                  v-model="edit.descripcion"
                  required
                  label="Descripción"
                  type="text"
                ></v-text-field>
                <v-text-field
                  autofocus
                  v-model="edit.anio"
                  required
                  label="Año del modelo"
                  type="text"
                ></v-text-field>
                <v-checkbox v-model="edit.estado" required input-value="true" value label="Activo"></v-checkbox>
                <v-btn type="submit">Editar</v-btn>
              </v-form>
            </v-container>
          </v-list>
        </v-card>
      </v-dialog>
    </v-row>
  </v-container>
</template>
<script>
import showModelo from "./ShowModelo";
import { mdiAccount, mdiPencil, mdiShareVariant, mdiDelete } from "@mdi/js";
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
      search: "",
      headers: [
        { text: "Código", value: "codigo" },
        { text: "Descripción", value: "descripcion" },
        { text: "Año Modelo", value: "anio" },
        { text: "Estado", value: "estado" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete
      }
    };
  },
  mounted() {
    this.$store.dispatch("loadModelosActivas");
  },
  computed: {
    ...mapState(["modelo"])
  },
  components: {
    showModelo
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
        .dispatch("deleteModelo", idM)
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
      this.edit.anio = item.anio;
      this.edit.estado = item.estado;
    },
    editFreshItem() {
      return {
        codigo: "",
        descripcion: "",
        anio: "",
        estado: true
      };
    },
    editarRegistro(){
        this.$store.dispatch("updateModelo", this.edit).then(() => {
            // this.$store.dispatch("loadModelosActivas");
            this.dialog2 = false;
            this.titleAlerta = "El registro ha sido actualizado correctamente";
            this.showAlert("success");
            this.checkbox1 = false;
        }).catch((err) => {
            this.dialog2 = false;
            this.titleAlerta = "Error al tratar de actualizar el registro";
            this.showAlert("success");
        });
    },
    onCheckboxChange(newValue, oldValue) {
      if (newValue == true) {
        this.$store.dispatch("loadModelosInActivas")
      }else{
        this.$store.dispatch("loadModelosActivas")
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