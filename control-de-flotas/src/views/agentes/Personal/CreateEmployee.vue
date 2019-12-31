<template>
  <div>
    <showEmpleado/>
    <Empleado/>
  </div>
</template>

<script>
import Empleado from './Empleado'
import showEmpleado from './ShowEmployee'
  export default {
    components: {
      Empleado,
      showEmpleado
    },
  }
</script>

<style lang="scss" scoped>

</style>