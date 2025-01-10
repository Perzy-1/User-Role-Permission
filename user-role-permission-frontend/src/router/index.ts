import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import About from '../views/AboutView.vue'
import SettingsView from '../views/SettingsView.vue'
import UserList from '../views/UserList.vue'
import EditUser from '../views/EditUser.vue'
import RoleList from '../views/RoleList.vue'
import RoleManager from '../views/RoleManager.vue'

import UserCreationForm from '../components/UserCreationForm.vue'
import Login from '../components/LoginForm.vue'

import { useAuthStore } from '../stores/authstore' // Ensure casing matches

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/home',
      name: 'home',
      component: HomeView,
      meta: { requiresAuth: true }, // Protect the home route
    },
    {
      path: '/login',
      name: 'Login',
      component: Login,
    },
    {
      path: '/about',
      name: 'About',
      component: About,
      meta: { requiresAuth: true }, // Protect the home route
    },
    {
      path: '/settings',
      name: 'Settings',
      component: SettingsView,
      meta: { requiresAuth: true }, // Protect the home route
    },
    {
      path: '/UserCreationForm',
      name: 'UserCreationForm',
      component: UserCreationForm,
      meta: { requiresAuth: true }, // Protect the home route
    },
    {
      path: '/users',
      name: 'UserList',
      component: UserList,
      meta: { requiresAuth: true },
    },
    {
      path: '/users/edit/:id',
      name: 'EditUser',
      component: EditUser,
      meta: { requiresAuth: true },
    },
    {
      path: '/roles',
      name: 'RoleList',
      component: RoleList,
      meta: { requiresAuth: true },
    },
    {
      path: '/roles/edit/:id',
      name: 'RoleManager',
      component: RoleManager,
      meta: { requiresAuth: true },
    },
  ],
})

// Navigation guard to protect routes
router.beforeEach((to, from, next) => {
  const authStore = useAuthStore()

  // Check if the route requires authentication
  if (to.meta.requiresAuth && !authStore.token) {
    next('/login') // Redirect to login if not authenticated
  } else {
    next() // Allow navigation
  }
})

export default router
