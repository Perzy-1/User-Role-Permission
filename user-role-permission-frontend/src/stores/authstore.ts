// src/store/authStore.ts
import { defineStore } from 'pinia'
import axios from 'axios'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null as any,
    // Check if localStorage has a token, or initialize with an empty string if null
    token: localStorage.getItem('token') || '', // Ensure this is always a string
  }),
  getters: {
    isAuthenticated: (state) => !!state.user, // Return true if a user is logged in
  },
  actions: {
    async login(email: string, password: string) {
      try {
        const response = await axios.post(import.meta.env.VITE_API_BASE_URL + '/login', {
          email,
          password,
        })
        this.user = response.data.user
        this.token = response.data.token

        // Save the token to localStorage for persistence
        localStorage.setItem('token', this.token)

        // Set the authorization header for axios requests
        axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
      } catch (error: any) {
        throw new Error(error.response.data.message || 'Login failed')
      }
    },
    logout() {
      this.user = null
      this.token = ''

      // Remove token from localStorage
      localStorage.removeItem('token')

      // Remove Authorization header from axios
      delete axios.defaults.headers.common['Authorization']
    },
  },
})
