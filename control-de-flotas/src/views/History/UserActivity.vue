<template>
  <v-container>
    <v-card>
      <v-container>
        <v-row>
          <v-col cols="12" sm="6" md="5">
            <v-menu
              ref="menu"
              v-model="menu"
              :close-on-content-click="false"
              :return-value.sync="selected.fechaD"
              transition="scale-transition"
              offset-y
              min-width="290px"
            >
              <template v-slot:activator="{ on }">
                <v-text-field
                  v-model="selected.fechaD"
                  label="Fecha Desde"
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker
                locale="Py"
                v-model="selected.fechaD"
                :max="selected.fechaH"
                no-title
                scrollable
              >
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                <v-btn
                  text
                  color="primary"
                  @click="$refs.menu.save(selected.fechaD)"
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
              :return-value.sync="selected.fechaH"
              transition="scale-transition"
              offset-y
              min-width="290px"
            >
              <template v-slot:activator="{ on }">
                <v-text-field
                  v-model="selected.fechaH"
                  label="Fecha Hasta"
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker
                locale="Py"
                v-model="selected.fechaH"
                no-title
                scrollable
                :min="selected.fechaD"
                :max="new Date().toISOString().substr(0, 10)"
              >
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu2 = false"
                  >Cancel</v-btn
                >
                <v-btn
                  text
                  color="primary"
                  @click="$refs.menu2.save(selected.fechaH)"
                  >OK</v-btn
                >
              </v-date-picker>
            </v-menu>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-autocomplete
              v-model="selected.usuario"
              label="Usuarios"
              :items="personal.personal"
              item-text="email"
              item-value="email"
            ></v-autocomplete>
          </v-col>
          <v-col>
            <v-btn @click="filtrarActividades()">Filtrar</v-btn>
          </v-col>
        </v-row>
      </v-container>
      <v-card-title>
        Acitividades de usuarios
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          label="Buscar"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="userActivity.userAcitvity"
        :search="search"
      ></v-data-table>
    </v-card>
  </v-container>
</template>

<script>
import { mapState } from "vuex";
import GraficoUser from "./GraficoUser.vue";
export default {
  data() {
    return {
      selected: this.seletedFresh(),
      menu: false,
      menu2: false,
      search: "",
      headers: [
        { text: "Evento", value: "evento" },
        { text: "Fecha Hora", value: "fecha" },
        { text: "Usuario", value: "usuario" },
        { text: "Tabla", value: "tabla" }
      ]
    };
  },
  components: {
    'grafico-user': GraficoUser,
  },
  mounted () {
      this.$store.dispatch("loadUsuarioSistema");
  },
  computed: {
    ...mapState(["userActivity", "personal"])
  },
  methods: {
    seletedFresh() {
      return {
        fechaD: "2019-11-01",
        fechaH: new Date().toISOString().substr(0, 10),
        usuario: ""
      };
    },
    filtrarActividades() {
      console.log(this.selected)
      this.$store.dispatch("loadUserActivity", this.selected);
    }
  }
};
</script>

<style lang="scss" scoped></style>
