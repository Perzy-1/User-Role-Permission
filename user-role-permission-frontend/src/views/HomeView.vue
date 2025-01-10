<template>
  <main>
    <h1 v-if="authStore.user">Welcome, {{ authStore.user.full_name }}</h1>
  </main>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { useAuthStore } from '../stores/authstore' // Ensure casing matches

// Get the authentication store and the router
const authStore = useAuthStore()
const router = useRouter()
</script>
