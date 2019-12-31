 <template>
  <v-container>
    <v-card>
      <ShowProveedor />
      <v-card-title>
        Proveedor
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-data-table :headers="headers" :items="proveedor.proveedor" :search="search">
        <template v-slot:item.estado="{ item }">
          <v-icon>{{item.estado==1 ? icons.mdiCheck : icons.mdiClose}}</v-icon>
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn text rounded>
            <v-icon small class="mr-2">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn text rounded>
            <v-icon small>{{ icons.mdiDelete }}</v-icon>
          </v-btn>
        </template>
      </v-data-table>
    </v-card>
  </v-container>
</template> 

<script>
import ShowProveedor from "./ShowProveedor";
import { mapState } from "vuex";
import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiFormatListBulletedSquare,
  mdiCheck,
  mdiClose
} from "@mdi/js";
export default {
  data() {
    return {
      search: "",
      headers: [
        { text: "Código", value: "codigo" },
        { text: "Razon Social", value: "razonSocial" },
        { text: "Direción", value: "direccion" },
        { text: "Teléfono Empresa", value: "telefono" },
        { text: "Email", value: "email" },
        { text: "Contacto", value: "nombreContacto" },
        { text: "Teléfono Contacto", value: "telefonoContacto" },
        { text: "Estado", value: "estado" },
        { text: "Ciudad", value: "city" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiCheck,
        mdiClose
      }
    };
  },
  mounted () {
      this.$store.dispatch("loadProveedor");
      this.$store.dispatch("loadCiudades");
  },
  computed: {
      ...mapState(["proveedor"])
  },
  components: {
      ShowProveedor,
  },
};
</script>