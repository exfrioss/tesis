import axios from "axios";
import { Line } from "vue-chartjs";
const URL_API = "http://127.0.0.1:3030";
const activityUrl = `${URL_API}/actividades`;
export const state = {
  day: 1,
  usuario: ""
};
export default {
  extends: Line,
  mounted() {
    const seturl = `${activityUrl}/${state.usuario}`;
    axios
      .get(seturl)
      .then(result => {
        console.log(
          "resp"
          // result.data[1].labels.map(etiqueta => etiqueta.estiqueta)
        );
        this.rows = result.data[0].rows;
        this.labels = result.data[1].labels.map(etiqueta => etiqueta.estiqueta);
        this.setUpGraph();
      })
      .catch(err => {
        console.log(err);
      });
  },
  data() {
    return {
      rows: [],
      labels: []
    };
  },
  methods: {
    setUpGraph() {
      this.renderChart(
        {
          labels: this.labels,
          datasets: [
            {
              label: "Acciones de usuarios (Últimas 24 horas)",
              backgroundColor: ["#FF6384", "#4BC0C0", "#FFCE56"],
              data: this.rows
            }
          ]
        },
        {
          responsive: true,
          maintainAspectRatio: false
        }
      );
    }
  }
};
