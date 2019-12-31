<template>
  <div>
    <h1>Talonario</h1>
    <v-alert :color="type"  v-if="type">{{message}}</v-alert>
    <v-form v-model="valid" @submit.prevent="setInsertTalonario()">
      <v-container>
        <v-row>
          <v-col cols="12" md="6">
            <v-text-field
              v-model="insert.codT"
              :rules="nameRules"
              :counter="10"
              label="Nro Timbrado"
              required
            ></v-text-field>
          </v-col>

          <v-col cols="12" md="6">
            <v-text-field
              v-model="insert.CodE"
              :rules="nameRules"
              :counter="10"
              label="Código de establecimiento"
              required
            ></v-text-field>
          </v-col>
        </v-row>
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
                  v-model="insert.fechaI"
                  label="Fecha Inicio Vigencia"
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker
                locale="Py"
                v-model="insert.fechaI"
                :max="insert.fechaF"
                no-title
                scrollable
              >
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                <v-btn
                  text
                  color="primary"
                  @click="$refs.menu.save(insert.fechaI)"
                  >OK</v-btn
                >
              </v-date-picker>
            </v-menu>
          </v-col>
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
                  label="Fecha Fin vigencia"
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker
                locale="Py"
                v-model="insert.fechaF"
                no-title
                scrollable
                :min="insert.fechaI"
              >
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu2 = false"
                  >Cancel</v-btn
                >
                <v-btn
                  text
                  color="primary"
                  @click="$refs.menu2.save(insert.fechaF)"
                  >OK</v-btn
                >
              </v-date-picker>
            </v-menu>
          </v-col>
          <v-col cols="12" md="4">
            <v-text-field
              v-model="insert.nroI"
              :rules="nameRules"
              :counter="10"
              label="Nro Inicio"
              required
            ></v-text-field>
          </v-col>

          <v-col cols="12" md="4">
            <v-text-field
              v-model="insert.nroA"
              :rules="nameRules"
              :counter="10"
              label="Nro Actual"
              required
            ></v-text-field>
          </v-col>

          <v-col cols="12" md="4">
            <v-text-field
              v-model="insert.nroF"
              :rules="nameRules"
              :counter="10"
              label="Nro Fin"
              required
            ></v-text-field>
          </v-col>
          <v-col>
            <v-checkbox
              v-model="insert.activo"
              required
              input-value="true"
              value
              label="Activo"
            ></v-checkbox>
          </v-col>
        </v-row>
        <v-btn type="submit">Guardar</v-btn>
      </v-container>
    </v-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      type:"",
      message: "",
      menu: false,
      menu2: false,
      insert: this.insertFresh(),
      valid: false,
      nameRules: [
        v => !!v || "Nro es necesario"
        //   v => v.length <= 10 || "Nro no puede seuperar los 10 caracteres"
      ]
    };
  },
  methods: {
    insertFresh() {
      return {
        codT: "",
        CodE: "",
        fechaI: new Date().toISOString().substr(0, 10),
        fechaF: new Date().toISOString().substr(0, 10),
        nroI: 0,
        nroA: 0,
        nroF: 0,
        activo: true,
        usuario: ""
      };
    },
    setInsertTalonario() {
      this.insert.usuario = this.$store.getters.UserLogueado;
      console.log(this.insert.CodE);
      this.$store
        .dispatch("insertTalonario", this.insert)
        .then(() => {
          this.message = "Se ha registrado correctamente";
          this.showAlert("success");
        })
        .catch(err => { console.log(err) });
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
  }
};
</script>

<style lang="scss" scoped></style>
