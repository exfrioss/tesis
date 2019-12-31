<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12">
        <v-row :align="alignment" :justify="justify" class="grey lighten-5" style="height: 300px;">
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Cliente</v-card-title>
            <v-card-text>Aquí puedes realizar las: Altas, Bajas y modificaciones de Clientes</v-card-text>
            <v-card-actions>
              <v-btn text to="listCliente">Cliente</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Personal</v-card-title>
            <v-card-text>Aquí puedes realizar las: Altas, Bajas y modificaciones de Personal</v-card-text>
            <v-card-actions>
              <v-btn text to="listEmployee">Personal</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="600" class="mx-auto">
            <v-card-title>Proveedor</v-card-title>
            <v-card-text>Aquí puedes realizar las: Altas, Bajas y modificaciones de Proveedor</v-card-text>
            <v-card-actions>
              <v-btn text to="listProveedor">Proveedor</v-btn>
            </v-card-actions>
          </v-card>
        </v-row>
      </v-col>
      <v-col cols="12">
        <v-row :align="alignment" :justify="justify" class="grey lighten-5" style="height: 300px;">
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Cargo</v-card-title>
            <v-card-text>Aquí puedes realizar las: Altas, Bajas y modificaciones de Cargo</v-card-text>
            <v-card-actions>
              <v-btn text to="listCargo">Cargo</v-btn>
            </v-card-actions>
          </v-card>
          <!-- <v-card max-width="400" class="mx-auto">
            <v-card-title>Personal</v-card-title>
            <v-card-text>Aquí puedes realizar las: Altas, Bajas y modificaciones de Personal</v-card-text>
            <v-card-actions>
              <v-btn text to="listEmployee">Personal</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="600" class="mx-auto">
            <v-card-title>Proveedor</v-card-title>
            <v-card-text>Aquí puedes realizar las: Altas, Bajas y modificaciones de Proveedor</v-card-text>
            <v-card-actions>
              <v-btn text to="listProveedor">Proveedor</v-btn>
            </v-card-actions> -->
          <!-- </v-card> -->
        </v-row>
      </v-col>
      <v-col cols="12">
        <v-row justify="center">
          <v-col cols="6" md="2">
            <v-select v-model="alignment" :items="alignmentsAvailable" label="Align"></v-select>
          </v-col>

          <v-col cols="6" md="2">
            <v-select v-model="justify" :items="justifyAvailable" label="Justify"></v-select>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      alignmentsAvailable: ["start", "center", "end", "baseline", "stretch"],
      alignment: "center",
      dense: false,
      justifyAvailable: [
        "start",
        "center",
        "end",
        "space-around",
        "space-between"
      ],
      justify: "center"
    };
  }
};
</script>

<style lang="scss" scoped>
</style>