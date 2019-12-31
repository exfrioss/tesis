<template>
  <div>
    <lista-pedidos-true></lista-pedidos-true>
  </div>
</template>

<script>
import ListaPedidosConfirmados from "./ListaPedidosConfirmados";
export default {
  components: {
    "lista-pedidos-true": ListaPedidosConfirmados
  }
};
</script>

<style lang="scss" scoped></style>
