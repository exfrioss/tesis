<template>
  <div>
    <navServicio />
    <v-container>
      <v-form @submit.prevent="createServicio()">
        <v-row>
          <v-col cols="12" md="2">
            <v-text-field v-model="insert.codigo" disabled v-show="true" label="Codigo servicio"></v-text-field>
          </v-col>
          <v-col cols="12" md="5">
            <v-text-field v-model="insert.descripcion" autofocus label="Descripción"></v-text-field>
          </v-col>
          <v-col cols="12" md="5">
            <v-autocomplete
              :items="vehiculo.vehiculos"
              item-text="tDescripcion"
              item-value="codigoVehiculo"
              v-model="insert.idVehiculo"
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
              v-model="insert.idOrigen"
              label="Ciudad de Origen"
            ></v-autocomplete>
          </v-col>
          <v-col cols="12" md="6">
            <v-autocomplete
              :items="ciudad.ciudad"
              item-value="codigo"
              item-text="descripcion"
              v-model="insert.idDestino"
              label="Ciudad de Destino"
            ></v-autocomplete>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12" md="6">
            <v-text-field v-model="insert.origen" label="Lugar de Origen"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-text-field v-model="insert.destino" label="Lugar de Destino"></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12" md="6">
            <v-text-field v-model="insert.precio" label="Precio del servicio" type="number"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
              <v-select
              v-model="insert.iva"
              :items="ivas"
              :rules="[v => !!v || 'Iva es requerido']"
              label="Iva"
              required
            >
            </v-select>
          </v-col>
        </v-row>
        <v-checkbox
            v-model="insert.estado"
            required
            input-value="true"
            value
            disabled
            label="Activo"
          ></v-checkbox>
            <div class="my-2">
              <v-btn depressed color="primary" type="submit">Guardar</v-btn>
            </div>
      </v-form>
    </v-container>
  </div>
</template>

<script>
import navServicio from "./NavServicio";
import { mapState } from "vuex";
export default {
  data() {
    return {
      insert: this.createServicioFreesh(),
      ivas: ["0", "5", "10"]
    };
  },
  components: {
    navServicio,
  },
  methods: {
    createServicioFreesh() {
      return {
        codigo: "",
        descripciones: "",
        idVehiculo: "",
        idFuncionario: "",
        origen: "",
        destino: "",
        idOrigen: "",
        idDestino: "",
        number: "",
        precio: "",
        estado: true
      };
    },
    createServicio() {
      this.$store.dispatch("createServicio", this.insert);
    }
  },
  computed: {
    ...mapState(["personal", "vehiculo", "ciudad", "servicio"])
  },
  mounted() {
    this.$store.dispatch("loadCiudades");
    this.$store.dispatch("loadPersonal");
    this.$store.dispatch("loadVehiculosActivos");
    // this.$store.dispatch()
  }
};
</script>