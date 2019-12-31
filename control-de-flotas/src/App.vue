<template>
  <v-app>
    <!-- <v-sheet  class="overflow-hidden" style="position: relative;"> -->
      <v-app-bar app color="primary" dark>
        <v-toolbar-title class="headline text-uppercase">
          <v-btn text rounded @click.stop="drawer = !drawer">|||</v-btn>
          <span>Tesis</span>
          <span class="font-weight-light">-Control de flotas</span>
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn
        v-for="link in links"
        :key="`${link.label}-header-link`"
        text 
        rounded 
        :to="link.url" 
        >
        {{link.label}}
        </v-btn>
      </v-app-bar>
      <v-content>
        <router-view></router-view>
        <v-container app>
          <v-navigation-drawer v-model="drawer" absolute temporary>
            <v-list-item>
              <v-list-item-avatar>
                <v-img src="https://randomuser.me/api/portraits/men/78.jpg"></v-img>
              </v-list-item-avatar>

              <v-list-item-content>
                <v-list-item-title>{{userLogueado}}</v-list-item-title>
              </v-list-item-content>
            </v-list-item>

            <v-divider></v-divider>

            <v-list dense v-show="isAuthenticated">
              <v-list-item v-for="item in items" :key="item.title" link>
                <!-- <v-list-item-icon>
                  <v-icon>{{ item.icon }}</v-icon>
                </v-list-item-icon> -->

                <v-list-item-content>
                  <v-list-item-title ><v-btn text :to="item.enlace">{{ item.title }}</v-btn></v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </v-navigation-drawer>
          <v-row align="center" justify="center">
          </v-row>
        </v-container>
      </v-content>
      <v-footer color="primary lighten-1" padless>
			<v-layout justify-center wrap>
				<v-flex primary lighten-2 py-4 text-center white--text xs12>
					{{ new Date().getFullYear() }} — <strong>Tesis @frioss</strong>
				</v-flex>
			</v-layout>
		</v-footer>
    <!-- </v-sheet> -->
  </v-app>
</template>
<script>
import { mapState } from 'vuex'
export default {
  name: "App",
  data: () => ({
    links: [
      {
        label: 'Home', 
        url: '/',
      },
      {
        label: 'Login',
        url: '/login',
      },
      ],
    drawer: null,
    items: [
      { title: "Home"},
      { title: "Localidades", enlace:"/localidades"},
      { title: "Agentes", enlace:"/agentes"},
      { title: "Administrar Proveedor", enlace:"/administrarProveedor"},
      { title: "Administrar Cliente", enlace:"/administrarCliente"},
      { title: "Administrar Vehiculos", enlace:"/vehiculos"},
      { title: "Administrar Servicios", enlace:"/servicios"},
      { title: "Administrar Datos", enlace:"/datos"},
      { title: "Ajuste Factura", enlace:"/talonario"},
    ]
  }),
  computed: {
    isAuthenticated () {
      return this.$store.getters.isAuthenticated
    },
    userLogueado(){
      console.log(this.$store.getters.UserLogueado)
      return this.$store.getters.UserLogueado
  }
  },
};
</script>
