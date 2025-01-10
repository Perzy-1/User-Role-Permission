<template>
  <div class="login-container">
    <form @submit.prevent="handleLogin">
      <div>
        <label>Email:</label>
        <!-- Bind directly to form.email -->
        <input v-model="form.email" type="email" required />
      </div>
      <div>
        <label>Password:</label>
        <!-- Bind directly to form.password -->
        <input v-model="form.password" type="password" required />
      </div>
      <button type="submit">Login</button>
      <p v-if="error.message">{{ error.message }}</p>
    </form>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '../stores/authstore'

export default defineComponent({
  setup() {
    const router = useRouter()
    const authStore = useAuthStore()

    // Define the reactive form object
    const form = reactive({
      email: '',
      password: '',
    })

    // Reactive object to store error messages
    const error = reactive({ message: '' })

    // Handle the login
    const handleLogin = async () => {
      console.log('Form Data:', form) // Log the form data before sending it to the API
      try {
        await authStore.login(form.email, form.password)
        router.push('/home')
      } catch (err: any) {
        error.message = err.message
      }
    }

    return { form, handleLogin, error }
  },
})
</script>

<style scoped>
.login-container {
  height: auto;
  width: auto;
  padding: 50px;
  background-color: #646464;
  border-radius: 1rem;
  display: flex;
  flex-direction: column;
  align-items: center; /* Center the form horizontally */
}

form {
  display: flex;
  flex-direction: column;
  gap: 15px; /* Add spacing between form fields */
}

form div {
  display: flex;
  align-items: center;
  gap: 10px; /* Add space between label and input */
}

form label {
  width: 100px; /* Fixed width for alignment */
  text-align: right; /* Align the text to the right */
  color: white; /* Make the label color more visible */
}

form input {
  flex: 1; /* Make the input take up remaining space */
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

form button {
  background-color: #4caf50;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

form button:hover {
  background-color: #45a049;
}

p {
  color: red;
  margin: 0;
}
</style>
