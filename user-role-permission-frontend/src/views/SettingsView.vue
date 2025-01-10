<template>
  <div class="layout">
    <h1>This is a Settings page</h1>
  </div>
</template>

<script setup lang="ts">
import UserList from '../views/UserList.vue'
</script>

<style>
/* Layout with fixed navigation */
.layout {
  display: flex;
}

nav {
  position: fixed;
  top: 0;
  left: 0;
  width: 200px; /* Adjust width as needed */
  height: 100vh;
  background-color: #f4f4f4;
  padding: 20px;
  display: flex;
  flex-direction: column;
}

nav a {
  margin: 10px 0;
  text-decoration: none;
  color: #333;
}

@media (max-width: 1024px) {
  .layout {
    flex-direction: column;
  }

  nav {
    position: relative;
    width: 100%;
    height: auto;
  }
}
</style>
