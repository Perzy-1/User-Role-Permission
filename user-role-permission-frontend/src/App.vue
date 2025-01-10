<template>
  <!-- Sticky nav bar -->
  <nav v-if="authStore.isAuthenticated">
    <div>
      <!-- Always show the "Home" link -->
      <RouterLink to="/home" exact-active-class="active-link">Home</RouterLink>

      <!-- Show "About" and "Settings" when on the home page -->
      <RouterLink v-if="isHomePage || isAboutPage" to="/about" exact-active-class="active-link"
        >About</RouterLink
      >
      <RouterLink v-if="isHomePage || isAboutPage" to="/settings" exact-active-class="active-link"
        >Settings</RouterLink
      >

      <!-- Show "User Manager" and "Role Manager" if not on Home or About page -->
      <RouterLink v-if="!isHomePage && !isAboutPage" to="/users" exact-active-class="active-link"
        >User Manager</RouterLink
      >
      <RouterLink v-if="!isHomePage && !isAboutPage" to="/roles" exact-active-class="active-link"
        >Role Manager</RouterLink
      >

      <!-- Display logout button -->
      <button id="logout" @click="logout">Logout</button>
    </div>
  </nav>

  <!-- Centered content -->
  <div class="content">
    <RouterView />
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/authstore' // Ensure casing matches
import { ref, watch } from 'vue'
import { useRoute } from 'vue-router'

// Get the authentication store and the router
const authStore = useAuthStore()
const router = useRouter()
const route = useRoute()

// Track if we're on the home page, about page, or settings page
const isHomePage = ref(route.path === '/home')
const isAboutPage = ref(route.path === '/about')
const isSettingsPage = ref(route.path === '/settings')

// Watch for route changes to update the navigation dynamically
watch(
  () => route.path,
  (newPath) => {
    isHomePage.value = newPath === '/home'
    isAboutPage.value = newPath === '/about'
    isSettingsPage.value = newPath === '/settings'
  },
)
// Define the logout function with redirection
const logout = async () => {
  authStore.logout()
  router.push('/login') // Redirect to the login page after logout
}
</script>

<style scoped>
/* Make the nav bar stick to the top */
nav {
  position: sticky;
  top: 0;
  background-color: #333;
  padding: 10px;
  display: flex;
  justify-content: space-between; /* Ensure space between items */
  align-items: center;
  z-index: 1000;
  height: auto;
  width: 100%;
}

nav a,
nav button {
  margin-right: 20px;
  color: white;
  text-decoration: none;
  padding: 10px 15px;
  border-radius: 5px;
  transition: background-color 0.3s;
  width: auto;
  flex-shrink: 0; /* Prevents shrinking */
}

/* Hover effect */
nav a:hover,
nav button:hover {
  background-color: #555;
  cursor: pointer;
}
#logout {
  color: #555;
}

#logout:hover {
  color: white;
}

.content {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: transparent;
}
.active-link {
  background-color: #555; /* Change this to whatever color you'd like for the active tab */
  color: white;
  font-weight: bold; /* Optional: bold the active link */
}
</style>
