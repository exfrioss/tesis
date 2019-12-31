import axios from "axios";
import { Line } from "vue-chartjs";
const URL_API = "http://127.0.0.1:3030";
const activityUrl = `${URL_API}/actividadesPedidos`;

export default {
  extends: Line,
  mounted() {
    const seturl = `${activityUrl}`;
    axios
      .get(seturl)
      .then(result => {
        // console.log("resp", result.data[1].labels.map(label => label.label));
        this.rows = result.data[0].rows;
        console.log("rows:", this.rows);
        this.labels = result.data[1].labels.map(label => label.label);
        console.log("label:", this.labels);
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
              label: "Pedidos Anulados (Ultimos 30 días)",
              backgroundColor: ["#FF6384", "#4BC0C0", "#FFCE56"],
              data: this.rows,
              type: "bar"
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
