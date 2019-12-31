<template>
  <v-card width="400" class="mx-auto mt-5">
    <v-card-title class="pb-0">
      <h1 class="display-1">Login</h1>
    </v-card-title>
    <v-card-text>
      <v-form>
        <v-text-field 
          v-model="userData.email"
          label="Email" 
          prepend-icon="mdi-account-circle"
        />
        <v-text-field 
           v-model="userData.password"
          :type="showPassword ? 'text' : 'password'" 
          label="Contraseña"
          prepend-icon="mdi-lock"
          :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
          @click:append="showPassword = !showPassword"
        />
      </v-form>
      <v-alert v-show="bored" type="error">
      {{erorMsg}}
    </v-alert>
    </v-card-text>
    <v-divider></v-divider>
    <v-card-actions>
      <!-- <v-btn color="success">Register</v-btn> -->
      <v-spacer></v-spacer>
      <v-btn color="info" @click="authenticate">Login</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import {EventBus} from "../../utils/index";
// import Router from "../../router";
export default {
  name: 'Login',
  data() {
    return {
      showPassword: false,
      userData: this.userdatafreshLogin(),
      erorMsg: '',
      bored: false
    }
  },
  methods: {
      userdatafreshLogin(){
          return{
              email: "",
              password: ""
          }
      },
      authenticate() {
          this.$store.dispatch('login', this.userData).then(() => {
              this.$router.push("/").catch(err => {console.log(err)})
          }).catch((err) => {
              console.log(err);
          });
      }
  },
  mounted () {
      EventBus.$on('failedAuthentication', (msg)=>{
          this.bored = true
          console.log(msg)
          this.erorMsg = "Error de credenciales, Verifiqué su usuario y contraseña";
      })
  },
  beforeDestroy() {
      this.bored = false
      EventBus.$off('failedAuthentication')
    },
}
</script>