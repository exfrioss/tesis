<template>
  <v-container>
    <v-card>
       <v-alert :color="type"  v-if="type">{{titleAlerta}}</v-alert>
      <ShowCliente />
      <v-card-title class="d-flex">
        Cliente
        <v-checkbox class="pr-4" v-model="checkbox1" @change="onCheckboxChange" label="Eliminados:"></v-checkbox>
        <v-spacer></v-spacer>
        <v-text-field autofocus v-model="search" label="Buscar" single-line hide-details></v-text-field>
      </v-card-title>
      <v-data-table :headers="headers" :items="cliente.clientes" :search="search">
        <template v-slot:item.estado="{ item }">
          <v-icon>{{item.estado==1 ? icons.mdiCheck : icons.mdiClose}}</v-icon>
        </template>
        <template v-slot:item.action="{ item }">
          <v-btn text rounded @click="editItem(item)">
            <v-icon  class="mr-2">{{icons.mdiPencil}}</v-icon>
          </v-btn>
          <v-btn :disabled="checkbox1" text rounded @click="activarDialogo(item.codigo)">
            <v-icon >{{ icons.mdiDelete }}</v-icon>
          </v-btn>
          <v-btn text rounded @click="setActivity(item.codigo)">
            <v-icon >{{ icons.mdiHistory }}</v-icon>
          </v-btn>
          <v-btn text rounded @click="showPedidos(item.codigo)">
            <v-icon >{{ icons.mdiDolly }}</v-icon>
          </v-btn>
        </template>
      </v-data-table>

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
              <v-toolbar-title>Editar Registro</v-toolbar-title>
              <v-spacer></v-spacer>
              <v-toolbar-items>
                <v-btn dark text @click="dialog2 = false">Cancelar</v-btn>
              </v-toolbar-items>
            </v-toolbar>
            <v-list three-line subheader>
              <v-subheader>General</v-subheader>
              <v-container>
                <v-form v-model="valid" @submit.prevent="editarRegistro">
                  <v-container>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field
                    minlength="1"
                    maxlength="7"
                    v-model="edit.codigo"
                    :counter="7"
                    required
                    disabled
                    label="C.I-N°"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="2">
                  <v-text-field
                    min="0"
                    max="9"
                    v-model="edit.ruc"
                    :rules="rucRules"
                    required
                    label="RUC"
                    type="number"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="6">
                  <v-text-field
                    v-model="edit.nombre"
                    :rules="descripcionRules"
                    required
                    label="Nombres"
                    type="text"
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>

            <v-container>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="edit.apellido"
                    :rules="apellidoRules"
                    required
                    label="Apellidos"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="edit.telefono"
                    :rules="telefonoRules"
                    required
                    label="Teléfono"
                    type="text"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field
                    v-model="edit.email"
                    :rules="emailRules"
                    required
                    label="Email"
                    type="text"
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>

            <v-container>
              <v-row>
                <v-col cols="12" md="6">
                  <v-text-field v-model="edit.direccion" label="Dirección" type="text"></v-text-field>
                </v-col>
                <v-col cols="12" md="6">
                  <v-select
                    v-model="edit.ciudad"
                    :items="ciudad.ciudad"
                    item-value="codigo"
                    item-text="descripcion"
                    :rules="[v => !!v || 'Ciudad es requerido']"
                    label="Ciudad"
                    required
                  >
                    <template v-slot:item="{ item }">{{item.codigo}} - {{item.descripcion}}</template>
                  </v-select>
                </v-col>
              </v-row>
            </v-container>
            <v-row>
              <v-col cols="12" sm="6" md="6">
                <v-menu
                  ref="menu"
                  v-model="menu"
                  :close-on-content-click="false"
                  :return-value.sync="edit.fechaI"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                    autofocus
                      v-model="edit.fechaI"
                      label="Fecha de Ingreso"
                      :prepend-icon="icons.mdiCalendar"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker v-model="edit.fechaI" no-title scrollable>
                    <v-spacer></v-spacer>
                    <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                    <v-btn text color="primary" @click="$refs.menu.save(edit.fechaI)">OK</v-btn>
                  </v-date-picker>
                </v-menu>
              </v-col>
              <!--  -->
              <v-col cols="12" sm="6" md="6">
                <v-menu
                  ref="menu2"
                  v-model="menu2"
                  :close-on-content-click="false"
                  :return-value.sync="edit.fechaN"
                  transition="scale-transition"
                  offset-y
                  min-width="290px"
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      v-model="edit.fechaN"
                      label="Fecha nacimiento"
                      :prepend-icon="icons.mdiCalendar"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker v-model="edit.fechaN" no-title scrollable>
                    <v-spacer></v-spacer>
                    <v-btn text color="primary" @click="menu2 = false">Cancel</v-btn>
                    <v-btn text color="primary" @click="$refs.menu2.save(edit.fechaN)">OK</v-btn>
                  </v-date-picker>
                </v-menu>
              </v-col>
            </v-row>

           <v-row>
             <v-col cols="12" md="6">
                  <v-select
                    v-model="edit.sexo"
                    :items="sex"
                    item-value="sexo"
                    item-text="descripcion"
                    :rules="[v => !!v || 'Sexo es requerido ?) ']"
                    label="Sexo"
                    required
                  >
                    <template v-slot:item="{ item }">{{item.sexo}} - {{item.descripcion}}</template>
                  </v-select>
                </v-col>
             <v-col cols="12" md="3">
                <v-checkbox v-model="edit.estado" required input-value="true" value label="Activo"></v-checkbox>
             </v-col>
             <v-col cols="12" md="3">
                <v-checkbox v-model="checkbox2" required input-value="true" value label="Es Usuario?"></v-checkbox>
             </v-col>
           </v-row>
           <v-row>
             <v-col cols="12" sm="12" md="5">
                  <v-text-field
                    @keyup="validarPassword()"
                    v-show="checkbox2"
                    minlength=8
                    hint="Por lo menos 8 caracteres"
                    v-model="edit.password"
                    :append-icon="show2 ? icons.mdiEyeCheckOutline : icons.mdiEyeOffOutline "
                    :type="show2 ? 'text' : 'password'"
                    class="input-group--focused"
                    @click:append="show2 = !show2"
                    label="Contraseña"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" sm="12" md="5">
                  <v-text-field
                  v-show="checkbox2"
                    @keyup="validarPassword()"
                    :append-icon="show3 ? icons.mdiEyeCheckOutline : icons.mdiEyeOffOutline "
                    :type="show3 ? 'text' : 'password'"
                    label="Repita su contraseña"
                    v-model="edit.password1"
                    class="input-group--focused"
                    :rules="passwordRules"
                    @click:append="show3 = !show3"
                  ></v-text-field>
                </v-col>
           </v-row>

            <v-btn :disabled="!valid" type="submit">Guardar</v-btn>
                </v-form>
              </v-container>
            </v-list>
          </v-card>
        </v-dialog>
      </v-row>


    </v-card>
  </v-container>
</template>

<script>
import ShowCliente from "./ShowCliente";
import { mapState } from "vuex";
import {
  mdiAccount,
  mdiPencil,
  mdiShareVariant,
  mdiDelete,
  mdiFormatListBulletedSquare,
  mdiCheck,
  mdiClose,
  mdiEyeOffOutline,
  mdiEyeCheckOutline,
  mdiHistory,
  mdiDolly
} from "@mdi/js";
export default {
  data() {
    return {
      value: this.valuefresh(),
      enabled: false,
      show3: false,
      show2: false,
      checkbox1: false,
      checkbox2: false,
      valid: true,
      disabled: false,
      activarOpciones: false,
      titleAlerta: "",
      dialog: false,
      dialog2:false,
      idM: "",
      search: "",
      type:"",
      menu: false,
      menu2: false,
      modal: false,
      edit: this.editFreshItem(),
      headers: [
        { text: "C.I-N°", value: "codigo" },
        { text: "Nombres", value: "nombre" },
        { text: "Apellidos", value: "apellido" },
        { text: "Direción", value: "direccion" },
        { text: "Teléfono", value: "telefono" },
        { text: "Email", value: "email" },
        { text: "Estado", value: "estado" },
        { text: "Ciudad", value: "cDescripcion" },
        { text: "Acción", value: "action" }
      ],
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiCheck,
        mdiClose,
        mdiHistory,
        mdiDolly
      },
      passwordRules: [v => !!v || "Campo requerido"],
      sex: [
          {sexo: 'F', descripcion:"Femenino"},
          {sexo: 'M', descripcion:"Masculino"}
      ],
      rucRules: [
        v => !!v || "Nombre es requerido",
        v => v.length <= 1 || "RUC sólo puede tener 1 valor"
      ],
      emailRules: [
        v => !!v || "Email es requerido",
        v =>
          /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(
            v
          ) || "E-mail no válido"
      ],
      descripcionRules: [v => !!v || "Nombre es requerido"],
      apellidoRules: [v => !!v || "Apellidos es requerido"],
      telefonoRules: [v => !!v || "Teléfono es requerido"],
    };
  },
  mounted () {
      this.$store.dispatch("loadClienteON");
      this.$store.dispatch("loadCiudades");
  },
  computed: {
      ...mapState(["cliente", "ciudad", "grafico"])
  },
  components: {
      ShowCliente,
  },
  methods: {
    editItem(item) {
      this.ite = item;
      console.log(this.ite, item);
      this.dialog2 = true;
      this.edit.codigo = item.codigo;
      this.edit.ruc = item.ruc;
      this.edit.nombre = item.nombre;
      this.edit.apellido = item.apellido;
      this.edit.email = item.email;
      this.edit.telefono = item.telefono;
      this.edit.direccion = item.direccion;
      this.edit.ciudad = item.city;
      this.edit.fechaN = item.sfechaN;
      this.edit.fechI = item.sfechaI;
      this.edit.sexo = item.sexo;
      this.edit.estado = item.estado;
      this.edit.isUsuario = this.checkbox2;
    },
    editFreshItem() {
      return {
        codigo: "",
        ruc: "",
        nombre: "",
        apellido: "",
        email: "",
        telefono: "",
        direccion: "",
        ciudad: "",
        fechaI: new Date().toISOString().substr(0, 10),
        fechaN: new Date().toISOString().substr(0, 10),
        sexo: "",
        estado: true,
        isUsuario: false,
        password: "",
        password1: ""
      };
    },
    showPedidos(codigo){
      this.$store.state.pedidoCliente.codcliente = codigo;
      this.$store.dispatch("pedidosClientesConfirmadosById", codigo).then(() => {
        this.$router.push("/showPedidosClientesConfirmados");
      }).catch((err) => {
        console.error(err)
      });
    },
    valuefresh(){
      return {
        fechaD: "2019-11-01",
        fechaH: new Date().toISOString().substr(0, 10),
        anulado: false,
        esconfirmado: true,
        codigoCliente: ""
      }
    },
    setActivity(codigo){
      this.grafico.codigoCliente = codigo;
      this.value.codigoCliente = codigo
      this.$store.dispatch("loadCustomerActivity", this.value).then(() => {
        console.log(this.value);
        this.$router.push("/clienteActivity").then(() => {}).catch((err) => {
          console.log(err);
        });;
      }).catch((err) => {
        console.log(err);
      });
    },
    editarRegistro() {
      this.$store.state.cliente.usuario = this.$store.getters.UserLogueado;
      this.$store
        .dispatch("updateCliente", this.edit)
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
    onCheckboxChange(newValue, oldValue) {
    	console.log("newValue: ", newValue, "Olvalue: ", oldValue);
      if (newValue == true) {
        this.$store.dispatch("loadClienteOFF")
      }else{
        this.$store.dispatch("loadClienteON")
      }
    },
    onCheckboxChange1(newValue, oldValue) {
      checkbox2 = true
    },
    activarDialogo(codigo) {
      console.log(codigo);
      this.idM = codigo;
      this.dialog = true;
    },
    eliminarRegistro(idM) {
      this.$store.state.cliente.usuario = this.$store.getters.UserLogueado;
      console.log(idM);
      this.edit.codigo = idM;
      this.$store
        .dispatch("deleteCliente", this.edit)
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
    },
    validarPassword() {
      if (this.edit.password != this.edit.password1) {
        console.log("Las contraseñas no coinciden");
      } else {
        console.log("Las contraseñas coinciden");
      }
    }
  },
};
</script>