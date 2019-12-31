<template>
  <div>
    <!-- <v-row justify="center"> -->
      <v-btn color="primary" class="ma-2" dark @click="dialog = true">Open Dialog 1</v-btn>
      <v-dialog
        v-model="dialog"
        fullscreen
        hide-overlay
        transition="dialog-bottom-transition"
        scrollable
      >
        <v-card tile>
          <v-toolbar flat dark color="primary">
            <v-btn icon dark @click="dialog = false">
              <v-icon>mdi-close</v-icon>
            </v-btn>
            <v-toolbar-title>Opciones de Pedido</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items>
              <v-btn dark text @click="dialog = false">Cancelar</v-btn>
            </v-toolbar-items>
          </v-toolbar>
          <v-card-text>
            <v-btn color="primary" dark class="ma-2" @click="dialog2 = !dialog2">Guardar Compra</v-btn>
            <v-tooltip right>
              <template v-slot:activator="{ on }">
                <v-btn class="ma-2" v-on="on">Anular Pedido</v-btn>
              </template>
              Tool Tip
            </v-tooltip>
            <v-list three-line subheader>
            </v-list>
          </v-card-text>

          <div style="flex: 1 1 auto;"></div>
        </v-card>
      </v-dialog>
    <!-- </v-row> -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      dialog: false
    };
  }
};
</script>

<style lang="scss" scoped>
</style>