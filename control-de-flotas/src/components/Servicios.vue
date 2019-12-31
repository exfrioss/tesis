<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12">
        <v-row :align="alignment" :justify="justify" class="grey lighten-5" style="height: 300px;">
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Servicios</v-card-title>
            <v-card-text>Aquí puedes realizar las: Altas, Bajas y modificaciones de lservicios ofresidos por la empresa</v-card-text>
            <v-card-actions>
              <v-btn text to="/listServicio">Lista de Servicios</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Asignar Insumos</v-card-title>
            <v-card-text>Aquí puedes asignar los insumos necesarios para cada servicios</v-card-text>
            <v-card-actions>
              <v-btn text to="/agregarInsumos">Asignar Insumos</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="600" class="mx-auto">
            <v-card-title>Orden de Servicios</v-card-title>
            <v-card-text>En éste modulo podremos realizar orden de servicios, de parte del cliente, recuerde qué ésta opción se encuentra disponible para los clientes</v-card-text>
            <v-card-actions>
              <v-btn text to="/serviciosCliente">Crear Orden</v-btn>
            </v-card-actions>
          </v-card>
        </v-row>
      </v-col>
      <!-- <v-row>
        <v-col cols="12">
        <v-row :align="alignment" :justify="justify" class="grey lighten-5" style="height: 300px;">
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Tipo de vehiculo</v-card-title>
            <v-card-text>Aquí puedes realizar las altas, bajas y modificaciones de los diferentes tipos de vehiculos</v-card-text>
            <v-card-actions>
              <v-btn text to="/listTipo">Estado de Pedidos y compras</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Create Vehiculo</v-card-title>
            <v-card-text>Aquí puedes vizualizar las compras y los pedidos realizados</v-card-text>
            <v-card-actions>
              <v-btn text to="/createVehiculo">Estado de Pedidos y compras</v-btn>
            </v-card-actions>
          </v-card>
        </v-row>
      </v-col>
      </v-row> -->
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