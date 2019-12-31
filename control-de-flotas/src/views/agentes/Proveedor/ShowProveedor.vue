<template>
  <v-content id="nav" class="nav">
    <nav>
      <v-btn class="ma-2" text to="listProveedor">
        <v-icon>{{icons.mdiFormatListBulletedSquare}}</v-icon>Lista Proveedor
      </v-btn>
      <v-btn text to="createProveedor">
        <v-icon>{{icons.mdiPlus}}</v-icon>Registrar Proveedor
      </v-btn>
      <v-btn text to="/agentes">
        <v-icon>{{icons.mdiKeyboardBackspace}}</v-icon>Atrás
      </v-btn>
    </nav>
  </v-content>
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
        mdiKeyboardBackspace
      }
    };
  }
};
</script>