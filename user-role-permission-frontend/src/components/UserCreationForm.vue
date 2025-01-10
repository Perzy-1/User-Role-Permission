<template>
  <div class="user-form">
    <h2>Create New User</h2>
    <form @submit.prevent="handleSubmit">
      <div>
        <label for="full_name">Full Name</label>
        <input type="text" id="full_name" v-model="user.full_name" required />
      </div>

      <div>
        <label for="email">Email</label>
        <input type="email" id="email" v-model="user.email" required />
      </div>

      <div>
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>

      <div>
        <label for="confirm_password">Confirm Password</label>
        <input type="password" id="confirm_password" v-model="user.confirm_password" required />
      </div>

      <div>
        <label for="role">Role</label>
        <!-- Dropdown menu for roles -->
        <select id="role" v-model="user.role" required @focus="fetchAvailableRoles">
          <option value="" disabled>Select Role</option>
          <!-- Show available roles -->
          <option v-for="role in availableRoles" :key="role.id" :value="role.id">
            {{ role.role_name }}
          </option>
        </select>
        <!-- Display message when no roles are available -->
        <p v-if="availableRoles.length === 0" class="no-role-message">
          No available role to assign
        </p>
      </div>

      <button type="submit">Create User</button>

      <!-- Display error message if there is one -->
      <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
      <p v-if="successMessage" class="success">{{ successMessage }}</p>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import axios from 'axios'

// Define the type for the Role
interface Role {
  id: number
  role_name: string
}

const user = ref({
  full_name: '',
  email: '',
  password: '',
  confirm_password: '',
  role: '',
})

const errorMessage = ref('')
const successMessage = ref('')
const availableRoles = ref<Role[]>([]) // Explicitly define the type for availableRoles

// Fetch available roles from the backend
const fetchAvailableRoles = async () => {
  console.log('Fetching available roles...') // Log when the fetch starts
  try {
    const response = await axios.get(import.meta.env.VITE_API_BASE_URL + '/available')
    console.log('Response data:', response.data) // Log the API response data
    availableRoles.value = response.data
  } catch (error) {
    console.error('Error fetching roles:', error) // Log any error that occurs
  }
}

// Fetch available roles when component is mounted
onMounted(() => {
  console.log('Component mounted, fetching available roles...') // Log when the component is mounted
  fetchAvailableRoles()
})

const handleSubmit = async () => {
  try {
    errorMessage.value = ''
    successMessage.value = ''

    // Send the user data to the backend
    const response = await axios.post(import.meta.env.VITE_API_BASE_URL + '/users', user.value)

    // Handle success response
    successMessage.value = response.data.message
    user.value = { full_name: '', email: '', password: '', confirm_password: '', role: '' }
  } catch (error: any) {
    // Handle error response
    errorMessage.value = error.response?.data?.message || 'Something went wrong!'
  }
}
</script>

<style scoped>
.error {
  color: red;
}

.success {
  color: green;
}

input,
select {
  border: solid white;
  border-radius: 0.5rem;
  margin-bottom: 10px;
  padding: 8px;
  width: 100%;
}

button {
  padding: 10px 20px;
  background-color: #4caf50;
  color: white;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
}

.no-role-message {
  color: red;
  font-size: 0.9rem;
}
</style>
