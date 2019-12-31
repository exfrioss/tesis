<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12">
        <v-row :align="alignment" :justify="justify" class="grey lighten-5" style="height: 300px;">
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Insumos</v-card-title>
            <v-card-text>Aquí puedes realizar las: Altas, Bajas y modificaciones de Insumos</v-card-text>
            <v-card-actions>
              <v-btn text to="listInsumo">Insumos</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Pedidos Proveedor</v-card-title>
            <v-card-text>Aquí puedes realizar, confirmar y anular Pedidos de insumos a los proveedores</v-card-text>
            <v-card-actions>
              <v-btn text to="listPedido">Pedidos Proveedores</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="600" class="mx-auto">
            <v-card-title>Compra Proveedor</v-card-title>
            <v-card-text>Aquí puedes realizar las compras a proveedores, a partir de los pedidos realizados, previamente....</v-card-text>
            <v-card-actions>
              <v-btn text to="/listCompra">Compra Proveedor</v-btn>
            </v-card-actions>
          </v-card>
        </v-row>
      </v-col>
      <v-col cols="12">
        <v-row :align="alignment" :justify="justify" class="grey lighten-5" style="height: 300px;">
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Estado de Pedidos y Compras</v-card-title>
            <v-card-text>Aquí puedes vizualizar las compras y los pedidos realizados</v-card-text>
            <v-card-actions>
              <v-btn text to="#">Estado de Pedidos y compras</v-btn>
            </v-card-actions>
          </v-card>
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