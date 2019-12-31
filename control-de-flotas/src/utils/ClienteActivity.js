// import axios from "axios";
import { Line } from "vue-chartjs";
import { mapState } from "vuex";
// const URL_API = "http://127.0.0.1:3030";

export default {
  extends: Line,
  mounted() {
    console.log("Montando");
    this.rows = this.$store.state.grafico.rows;
    console.log("Grafico Cliente rows: ", this.rows);
    this.labels = this.$store.state.grafico.labels;
    console.log("Grafio cliente labels: ", this.labels);
    this.setUpGraph();
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
              label: "Insumos Por Pedidos Realizados",
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
  },
  computed: {
    ...mapState(["grafico"])
  }
};
