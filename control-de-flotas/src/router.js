import Vue from "vue";
import Router from "vue-router";
import ListRegion from "./views/Region/ListRegion.vue";
import CreateRegion from "./views/Region/CreateRegion.vue";
import RegionShow from "./views/Region/RegionShow.vue";
import Home from "./views/Home.vue";
import CreateCiudad from "./views/Ciudad/CreateCiudad.vue";
import ListCiudad from "./views/Ciudad/ListCiudad.vue";
import ShowCiudad from "./views/Ciudad/ShowCiudad.vue";
import ListDepartamento from "./views/Departamento/ListDepartamento.vue";
import ShowDepartamento from "./views/Departamento/ShowDepartamento.vue";
import CreateDepartamento from "./views/Departamento/CreateDepartamento.vue";
import ListCliente from "./views/agentes/cliente/ListCliente.vue";
import CreateCliente from "./views/agentes/cliente/CreateCliente.vue";
import ShowCliente from "./views/agentes/cliente/ShowCliente.vue";
import Localidades from "../src/components/Localidades.vue";
import Agentes from "../src/components/Agentes.vue";
import ListEmployee from "./views/agentes/Personal/ListEmployee.vue";
import ShowEmployee from "./views/agentes/Personal/ShowEmployee.vue";
import CreateEmployee from "./views/agentes/Personal/CreateEmployee.vue";
import CreateProveedor from "./views/agentes/Proveedor/CreateProveedor.vue";
import ListProveedor from "./views/agentes/Proveedor/ListProveedor.vue";
import ShowProveedor from "./views/agentes/Proveedor/ShowProveedor.vue";
import ShowCargo from "./views/agentes/Cargo/ShowCargo.vue";
import ListCargo from "./views/agentes/Cargo/ListCargo.vue";
import CreateCargo from "./views/agentes/Cargo/CreateCargo.vue";
import AdministrarProveedor from "./components/AdministrarProveedor.vue";
import NavBarInsumo from "./components/NavBarInsumo.vue";
import ShowInsumo from "./views/Administrar/ShowInsumo.vue";
import CreateInsumo from "./views/Administrar/CreateInsumo.vue";
import ListInsumo from "./views/Administrar/ListInsumo.vue";
import CreatePedido from "./views/Pedidos/CreatePedidos.vue";
import TodoPedidos from "./views/Pedidos/TodoPedidos.vue";
import ListPedido from "./views/Pedidos/ListPedido.vue";
import DatePicker from "./views/DatePicker/DatePicker.vue";
import ListMarca from "./views/Vehiculo/marca/ListMarca.vue";
import CreateMarca from "./views/Vehiculo/marca/CreateMarca.vue";
import CreateModelo from "./views/Vehiculo/modelo/CreateModelo.vue";
import ShowModelo from "./views/Vehiculo/modelo/ShowModelo.vue";
import ListModelo from "./views/Vehiculo/modelo/ListModelo.vue";
import CreateSeguro from "./views/Vehiculo/seguro/CreateSeguro.vue";
import ListSeguro from "./views/Vehiculo/seguro/ListSeguro.vue";
import Vehiculos from "./components/Vehiculos.vue";
import CreateVehiculo from "./views/Vehiculo/vehiculo/CreateVehiculo.vue";
import ListTipo from "./views/Vehiculo/tipo/ListTipo.vue";
import CreateTipo from "./views/Vehiculo/tipo/CreateTipo.vue";
import ListVehiculo from "./views/Vehiculo/vehiculo/ListVehiculo.vue";
import CreateServicio from "./views/servicio/CreateServicio.vue";
import ListServicio from "./views/servicio/ListServicio.vue";
import Servicios from "./components/Servicios.vue";
import Empleado from "./views/agentes/Personal/Empleado.vue";
import Login from "./views/Login/Login.vue";
import store from "./store/store";
import ListCompra from "./views/Compra/ListCompra.vue";
import Datos from "./components/Datos.vue";
import AgregarInsumo from "./views/servicio/AgregarInsumo.vue";
import ServiciosCliente from "./views/servicio/ServiciosCliente.vue";
import CreatePedidoCliente from "./views/PedidoCliente/CreatePedidoCliente.vue";
import ComprasPorfecha from "./views/Compra/ComprasPorfecha.vue";
import ShowHistory from "./views/History/ShowHistory.vue";
import ShowPedidosClientesConfirmados from "./views/FacturaCliente/ShowPedidosClientesConfirmados.vue";
import AdministrarCliente from "./components/AdministrarCliente.vue";
import Talonario from "./views/Talonario/Talonario.vue";
import ListaTalonario from "./views/Talonario/ListaTalonarios.vue";
import DetallePedido from "./views/FacturaCliente/DetallePedido.vue";
import UserActivity from "./views/History/UserActivity.vue";

Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      name: "home",
      component: Home,
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/showCargo",
      name: "showCargo",
      component: ShowCargo,
      alias: "showCargo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listCargo",
      name: "listCargo",
      component: ListCargo,
      alias: "listCargo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createCargo",
      name: "createCargo",
      component: CreateCargo,
      alias: "createCargo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createProveedor",
      name: "createProveedor",
      component: CreateProveedor,
      alias: "createProveedor",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listProveedor",
      name: "listProveedor",
      component: ListProveedor,
      alias: "listProveedor",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/showProveedor",
      name: "showProveedor",
      component: ShowProveedor,
      alias: "showProveedor",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listRegion",
      name: "listRegion",
      component: ListRegion,
      alias: "listRegion",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createRegion",
      name: "createRegion",
      component: CreateRegion,
      alias: "createRegion",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/regionShow",
      name: "regionShow",
      component: RegionShow,
      alias: "regionShow",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createCiudad",
      name: "createCiudad",
      component: CreateCiudad,
      alias: "createCiudad",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listCiudad",
      name: "listCiudad",
      component: ListCiudad,
      alias: "listCiudad",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/showCiudad",
      name: "showCiudad",
      component: ShowCiudad,
      alias: "showCiudad",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listDepartamento",
      name: "listDepartamento",
      component: ListDepartamento,
      alias: "listDepartamento",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/showDepartamento",
      name: "showDepartamento",
      component: ShowDepartamento,
      alias: "showDepartamento",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createDepartamento",
      name: "createDepartamento",
      component: CreateDepartamento,
      alias: "createDepartamento",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listCliente",
      name: "listCliente",
      component: ListCliente,
      alias: "listCliente",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createCliente",
      name: "createCliente",
      component: CreateCliente,
      alias: "createCliente",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/showCliente",
      name: "showCliente",
      component: ShowCliente,
      alias: "showCliente",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/localidades",
      name: "localidades",
      component: Localidades,
      alias: "localidades",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/agentes",
      name: "agentes",
      component: Agentes,
      alias: "agentes",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listEmployee",
      name: "listEmployee",
      component: ListEmployee,
      alias: "listEmployee",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/showEmployee",
      name: "showEmployee",
      component: ShowEmployee,
      alias: "showEmployee",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createEmployee",
      name: "createEmployee",
      component: CreateEmployee,
      alias: "createEmployee",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/administrarProveedor",
      name: "administrarProveedor",
      component: AdministrarProveedor,
      alias: "administrarProveedor",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/showInsumo",
      name: "showInsumo",
      component: ShowInsumo,
      alias: "showInsumo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createInsumo",
      name: "createInsumo",
      component: CreateInsumo,
      alias: "createInsumo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listInsumo",
      name: "listInsumo",
      component: ListInsumo,
      alias: "listInsumo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/navBarInsumo",
      name: "navBarInsumo",
      component: NavBarInsumo,
      alias: "navBarInsumo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createPedido",
      name: "createPedido",
      component: CreatePedido,
      alias: "createPedido",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/todoPedidos",
      name: "todoPedidos",
      component: TodoPedidos,
      alias: "todoPedidos",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listPedido",
      name: "listPedido",
      component: ListPedido,
      alias: "listPedido",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/datePicker",
      name: "datePicker",
      component: DatePicker,
      alias: "datePicker",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listMarca",
      name: "listMarca",
      component: ListMarca,
      alias: "listMarca",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createMarca",
      name: "createMarca",
      component: CreateMarca,
      alias: "createMarca",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createModelo",
      name: "createModelo",
      component: CreateModelo,
      alias: "createModelo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/showModelo",
      name: "showModelo",
      component: ShowModelo,
      alias: "showModelo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listModelo",
      name: "listModelo",
      component: ListModelo,
      alias: "listModelo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createSeguro",
      name: "createSeguro",
      component: CreateSeguro,
      alias: "createSeguro",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listSeguro",
      name: "listSeguro",
      component: ListSeguro,
      alias: "listSeguro",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/vehiculos",
      name: "vehiculos",
      component: Vehiculos,
      alias: "vehiculos",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createVehiculo",
      name: "createVehiculo",
      component: CreateVehiculo,
      alias: "createVehiculo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listTipo",
      name: "listTipo",
      component: ListTipo,
      alias: "listTipo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createTipo",
      name: "createTipo",
      component: CreateTipo,
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listVehiculo",
      name: "listVehiculo",
      component: ListVehiculo,
      alias: "listVehiculo",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/createServicio",
      name: "createServicio",
      component: CreateServicio,
      alias: "createServicio",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/listServicio",
      name: "listServicio",
      component: ListServicio,
      alias: "listServicio",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/servicios",
      name: "servicios",
      component: Servicios,
      alias: "servicios",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/empleado",
      name: "empleado",
      component: Empleado,
      alias: "empleado",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      alias: "login"
    },
    {
      path: "/listCompra",
      name: "listCompra",
      component: ListCompra,
      alias: "listCompra"
    },
    {
      path: "/datos",
      name: "datos",
      component: Datos,
      alias: "datos",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/agregarInsumos",
      name: "agregarInsumos",
      component: AgregarInsumo,
      alias: "agregarInsumos",
      beforeEnter(to, from, next) {
        if (!store.getters.isAuthenticated) {
          next("/login");
        } else {
          next();
        }
      }
    },
    {
      path: "/serviciosCliente",
      name: "serviciosCliente",
      component: ServiciosCliente,
      alias: "serviciosCliente"
    },
    {
      path: "/createPedidoCliente",
      name: "createPedidoCliente",
      component: CreatePedidoCliente,
      alias: "createPedidoCliente"
    },
    {
      path: "/comprasPorfecha",
      name: "comprasPorfecha",
      component: ComprasPorfecha,
      alias: "comprasPorfecha"
    },
    {
      path: "/clienteActivity",
      name: "clienteActivity",
      component: ShowHistory,
      alias: "clienteActivity"
    },
    {
      path: "/showPedidosClientesConfirmados",
      name: "showPedidosClientesConfirmados",
      component: ShowPedidosClientesConfirmados,
      alias: "showPedidosClientesConfirmados"
    },
    {
      path: "/administrarCliente",
      name: "administrarCliente",
      component: AdministrarCliente,
      alias: "administrarCliente"
    },
    {
      path: "/talonario",
      name: "talonario",
      component: Talonario,
      alias: "talonario"
    },
    {
      path: "/listaTalonario",
      name: "listaTalonario",
      component: ListaTalonario,
      alias: "listaTalonario"
    },
    {
      path: "/detallePedido",
      name: "detallePedido",
      component: DetallePedido,
      alias: "detallePedido"
    },
    {
      path: "/userActivity",
      name: "userActivity",
      component: UserActivity,
      alias: "userActivity"
    }
  ]
});
