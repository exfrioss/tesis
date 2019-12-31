<template>
  <v-container id="nav" class="nav">
    <nav>
      <v-btn class="ma-2" text to="/listEmployee">
        <v-icon>{{icons.mdiFormatListBulletedSquare}}</v-icon>Lista Personal
      </v-btn>
      <v-btn text to="/createEmployee">
        <v-icon>{{icons.mdiPlus}}</v-icon>Registrar Personal
      </v-btn>
      <v-btn text to="/agentes">
        <v-icon>{{icons.mdiPlus}}</v-icon>Atrás
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
  mdiPlus
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
        mdiPlus
      }
    };
  }
};
</script>