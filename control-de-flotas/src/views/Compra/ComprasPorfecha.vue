<template>
    <div>
        <v-container>
            <v-row>
            <v-col cols="12" sm="6" md="5">
          <v-menu
            ref="menu"
            v-model="menu"
            :close-on-content-click="false"
            :return-value.sync="setData.fechaD"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field v-model="setData.fechaD" label="Fecha Pedido" v-on="on"></v-text-field>
            </template>
            <v-date-picker locale="Py" v-model="setData.fechaD" no-title scrollable>
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
              <v-btn text color="primary" @click="$refs.menu.save(setData.fechaD)">OK</v-btn>
            </v-date-picker>
          </v-menu>
        </v-col>
        <v-col cols="12" sm="6" md="5">
          <v-menu
            ref="menu2"
            v-model="menu2"
            :close-on-content-click="false"
            :return-value.sync="setData.fechaH"
            transition="scale-transition"
            offset-y
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field v-model="setData.fechaH" label="Fecha Pedido" v-on="on"></v-text-field>
            </template>
            <v-date-picker locale="Py" v-model="setData.fechaD" no-title scrollable>
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu2 = false">Cancel</v-btn>
              <v-btn text color="primary" @click="$refs.menu2.save(setData.fechaH)">OK</v-btn>
            </v-date-picker>
          </v-menu>
        </v-col>
        <v-col>
            <v-btn @click="setFiltro">Buscar</v-btn>
        </v-col>
        </v-row>
        </v-container>
        <listCompra/>
    </div>
</template>

<script>
    import listCompra from "./ListCompra"
    export default {
        data() {
            return {
                setData: this.filtarFresh(),
                modal: false,
                menu: false,
                menu2: false,
            }
        },
        components: {
            listCompra,
        },
        methods: {
            filtarFresh() {
                return {
                    fechaH: new Date().toISOString().substr(0, 10),
                    fechaD: new Date().toISOString().substr(0, 10),
                }
            },
            setFiltro(){
                this.$store.dispatch("loadComprasByFechas", this.setData).then(() => {
                    console.log("filtrando datos")
                }).catch((err) => {
                    console.log(err)
                });
            }
        },
    }
</script>