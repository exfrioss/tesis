<template>
  <v-container id="nav" class="nav">
    <nav>
      <v-btn class="ma-2" text to="/listCliente">
        <v-icon>{{icons.mdiFormatListBulletedSquare}}</v-icon>Lista Cliente
      </v-btn>
      <v-btn text to="/createCliente">
        <v-icon>{{icons.mdiPlus}}</v-icon>Registrar Cliente
      </v-btn>
      <v-btn text to="/agentes">
        <v-icon>{{icons.mdiKeyboardBackspace}}</v-icon>Atrás
      </v-btn>
    </nav>
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
  mdiCalendar,
  mdiKeyboardBackspace
} from "@mdi/js";
export default {
  data() {
    return {
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
        mdiFormatListBulletedSquare,
        mdiContentSave,
        mdiPlus,
        mdiCalendar,
        mdiKeyboardBackspace
      }
    };
  }
};
</script>