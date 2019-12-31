<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <navVehiculo />
        <h1>{{title}}</h1>
        <v-form @submit.prevent="createVehiculo">
          <v-row>
                  <v-col cols="12" md="4">
                    <v-text-field
                      v-model="insert.codigo"
                      required
                      label="Número de Chapa"
                      type="text"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4">
                    <v-text-field
                      v-model="insert.chasis"
                      :rules="descripcionRules"
                      required
                      label="Chasis"
                      type="text"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="4">
                    <v-text-field
                      v-model="insert.nroMotor"
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
                        v-model="insert.idtipo"
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
                        v-model="insert.idmodelo"
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
                        v-model="insert.idmarca"
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
                        v-model="insert.idseguro"
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
                    disabled
                      v-model="insert.estado"
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
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import navVehiculo from "./NavVehiculo";
import {mapState} from "vuex";
import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiFormatListBulletedSquare,
  mdiContentSave,
  mdiPlus,
  mdiCalendar
} from "@mdi/js";
// import ShowSeguro from "./ShowSeguro";
export default {
  data() {
    return {
      menu: false,
      menu2: false,
      modal: false,
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiContentSave,
        mdiPlus,
        mdiCalendar
      },
      alert: false,
      title: "Registrar Seguro",
      insert: this.createFreshVehiculo(),
      valid: true,
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"]
    };
  },
  mounted () {
    this.$store.dispatch("loadVehiculosActivos");
    this.$store.dispatch("loadMarcasActivas");
    this.$store.dispatch("loadModelosActivas");
    this.$store.dispatch("loadTiposActivos");
    this.$store.dispatch("loadSegurosActivos");
  },
  computed: {
    ...mapState(["tipo", "marca", "seguro", "vehiculo", "modelo"])
  },
  methods: {
    createFreshVehiculo() {
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
    createVehiculo() {
      this.$store.dispatch("createVehiculo", this.insert);
      this.modeloInsert = this.createFreshVehiculo();
      this.$router.push("listVehiculo");
      //   this.$store.dispatch("loadMarcasActivas");
    }
  },
  components: {
    navVehiculo
  }
};
</script>