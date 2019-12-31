<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <ShowSeguro />
        <h1>{{title}}</h1>
        <v-form @submit.prevent="createSeguro">
          <v-container>
            <v-row>
              <v-col cols="12" sm="6" md="6">
                <v-menu
                  ref="menu"
                  v-model="menu"
                  :close-on-content-click="false"
                  :return-value.sync="insert.fechaI"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                    autofocus
                      v-model="insert.fechaI"
                      label="Picker in menu"
                      :prepend-icon="icons.mdiCalendar"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker v-model="insert.fechaI" no-title scrollable>
                    <v-spacer></v-spacer>
                    <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                    <v-btn text color="primary" @click="$refs.menu.save(insert.fechaI)">OK</v-btn>
                  </v-date-picker>
                </v-menu>
              </v-col>
              <!--  -->
              <v-col cols="12" sm="6" md="6">
                <v-menu
                  ref="menu2"
                  v-model="menu2"
                  :close-on-content-click="false"
                  :return-value.sync="insert.fechaF"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      v-model="insert.fechaF"
                      label="Picker in menu"
                      :prepend-icon="icons.mdiCalendar"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker v-model="insert.fechaF" no-title scrollable>
                    <v-spacer></v-spacer>
                    <v-btn text color="primary" @click="menu2 = false">Cancel</v-btn>
                    <v-btn text color="primary" @click="$refs.menu2.save(insert.fechaF)">OK</v-btn>
                  </v-date-picker>
                </v-menu>
              </v-col>
            </v-row>
          </v-container>
          <v-text-field
            v-model="insert.codigo"
            :rules="descripcionRules"
            required
            label="Número contrato"
            type="text"
          ></v-text-field>

          <v-text-field
            v-model="insert.descripcion"
            :rules="descripcionRules"
            required
            label="Descripción"
            type="text"
          ></v-text-field>
          <v-text-field
            v-model="insert.costo"
            :rules="descripcionRules"
            required
            label="Costo del contrato"
            type="text"
          ></v-text-field>
          <v-checkbox
            v-model="insert.estado"
            :rules="estadoRules"
            required
            input-value="true"
            value
            disabled
            label="Activo"
          ></v-checkbox>
          <v-btn type="submit">Guardar</v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
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
import ShowSeguro from "./ShowSeguro";
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
      insert: this.createFreshSeguro(),
      valid: true,
      descripcionRules: [v => !!v || "Descripcion es requerido"],
      estadoRules: [v => !!true || "Debes pulsar el check"]
    };
  },
  methods: {
    createFreshSeguro() {
      return {
        codigo: "",
        fechaI: new Date().toISOString().substr(0, 10),
        fechaF: new Date().toISOString().substr(0, 10),
        descripcion: "",
        estado: true
      };
    },
    createSeguro() {
      this.$store.dispatch("createSeguro", this.insert);
      this.modeloInsert = this.createFreshSeguro();
      this.$router.push("listSeguro");
      //   this.$store.dispatch("loadMarcasActivas");
    }
  },
  components: {
    ShowSeguro
  }
};
</script>