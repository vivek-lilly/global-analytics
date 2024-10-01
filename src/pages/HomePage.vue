<template>
    <div>
        <contract-template />
    </div>
</template>

<script>
import ContractTemplate from '@/components/MachineTemplate.vue';

export default {
    name: 'HomePage',
    components: {
        'contract-template': ContractTemplate
    }
}
</script>

<style scoped></style>