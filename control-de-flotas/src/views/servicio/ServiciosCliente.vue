<template>
  <v-container>
    <div class="float-right">
      <pedidos-clientes-pendientes></pedidos-clientes-pendientes>
    </div>
        <v-row>
          <div v-for="item in servicio.servicios" :key="item.id">
            <v-col cols="12" md="11">
              <v-row
                :align="alignment"
                :justify="justify"
                class="grey lighten-5"
                style="height: 300px;"
              >
                <v-card max-width="400" class="mx-auto">
                  <v-card-title>{{ item.descripcion }}</v-card-title>
                  <v-card-text>
                    <p>Código: {{ item.codigo }}</p>
                    <p>
                      Ciudad origen: {{ item.dCiudadOrigen }}, Lugar:
                      {{ item.origen }}
                    </p>
                    <p>
                      Ciudad destino: {{ item.dCiudadDestino }}, Lugar:
                      {{ item.destino }}
                    </p>
                    <p>Precio (kg):{{ item.precio }}</p>
                  </v-card-text>
                  <v-card-actions>
                    <v-btn text @click="solicitarPedido(item)">Solicitar</v-btn>
                  </v-card-actions>
                </v-card>
              </v-row>
            </v-col>
          </div>
        </v-row>
  </v-container>
</template>

<script>
import { mapState } from "vuex";
import ListaPedidosPendientesAnulados from "../PedidoCliente/ListaPedidosPendientesAnulados";
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
  },
  mounted() {
    this.$store.dispatch("loadServiciosActivos");
  },
  computed: {
    ...mapState(["servicio"])
  },
  methods: {
    solicitarPedido(item) {
      console.log(item);
      this.$store.dispatch("getServicios", item);
      this.$router
        .push("/createPedidoCliente")
        .then(() => {})
        .catch(err => {
          console.log(err);
        });
    }
  },
  components: {
    "pedidos-clientes-pendientes": ListaPedidosPendientesAnulados
  }
};
</script>

<style lang="scss" scoped></style>
