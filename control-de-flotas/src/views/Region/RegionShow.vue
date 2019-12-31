<template>
  <v-container>
    <div id="nav" class="nav">
    <nav>
      <v-btn text to="/listRegion"><v-icon>{{icons.mdiFormatListBulletedSquare}}</v-icon>Lista Región</v-btn>
      <v-btn text to="/createRegion"><v-icon>{{icons.mdiPlus}}</v-icon>Registrar Región</v-btn>
      <v-btn text to="/localidades"><v-icon>{{icons.mdiKeyboardBackspace}}</v-icon>Atras</v-btn>
    </nav>
  </div>
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
<style lang="scss" scoped>
.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 60px;
}
.nav > .brand {
  font-family: "Montserrat", sans-serif;
  font-weight: 700;
  font-size: 1.5em;
  color: #39b982;
  text-decoration: none;
}
.nav .nav-item {
  box-sizing: border-box;
  margin: 0 5px;
  color: rgba(0, 0, 0, 0.5);
  text-decoration: none;
}
.nav .nav-item.router-link-exact-active {
  color: #39b982;
  border-bottom: solid 2px #39b982;
}
</style>
