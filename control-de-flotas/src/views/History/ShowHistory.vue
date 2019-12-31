<template>
    <div>
        <history-date></history-date>
        <cliente-activity></cliente-activity>
    </div>
</template>

<script>
import ClienteActivity from "./ClienteActivity"
import HistoryDate from "./HistoryDate"
    export default {
        components: {
            'cliente-activity': ClienteActivity,
            'history-date': HistoryDate,
        },
    }
</script>

<style lang="scss" scoped>

</style>