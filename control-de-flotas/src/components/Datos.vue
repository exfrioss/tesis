<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12">
        <v-row :align="alignment" :justify="justify" class="grey lighten-5" style="height: 300px;">
          <v-card max-width="400" class="mx-auto">
            <v-card-title>Acitividades de Usuarios</v-card-title>
            <v-card-text>Permite ver todas las actividades que los usuarios realizan en el sistema</v-card-text>
            <v-card-actions>
              <v-btn text to="/userActivity">Ver Actividades</v-btn>
            </v-card-actions>
          </v-card>
          <!-- <v-card max-width="400" class="mx-auto">
            <v-card-title>Restaurar Copia de Seguridad</v-card-title>
            <v-card-text>Nos permite volver a los datos, de la última copia de seguridad realizada, ya sea de forma de manual, como automatica, el sistema nos permite seleccionar el punto de restauración</v-card-text>
            <v-card-actions>
              <v-btn text to="#">Restaurar Copia</v-btn>
            </v-card-actions>
          </v-card>
          <v-card max-width="600" class="mx-auto">
            <v-card-title>Auditoría</v-card-title>
            <v-card-text>Te permite ver las acciones que há realizado el usuario, mostrando un historial desde el primer días de uso, las altas, bajas, modificaciones, anulaciones, etc
            </v-card-text>
            <v-card-actions>
              <v-btn text to="/listSeguro">Seguro Vehiculo</v-btn>
            </v-card-actions>
          </v-card> -->
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