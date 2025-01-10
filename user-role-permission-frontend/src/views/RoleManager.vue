<template>
  <div class="role-form">
    <h2>Create New Role</h2>
    <form @submit.prevent="handleSubmit">
      <div>
        <label for="role_name">Role Name</label>
        <input type="text" id="role_name" v-model="role.role_name" required />
      </div>

      <div>
        <label for="description">Description</label>
        <textarea id="description" v-model="role.description"></textarea>
      </div>

      <button type="submit">Create Role</button>

      <!-- Display error message if there is one -->
      <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
      <p v-if="successMessage" class="success">{{ successMessage }}</p>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import axios from 'axios'
import RoleList from '../views/RoleList.vue'
const role = ref({
  role_name: '',
  description: '',
})

const errorMessage = ref('')
const successMessage = ref('')
const emit = defineEmits()
const handleSubmit = async () => {
  try {
    errorMessage.value = ''
    successMessage.value = ''

    // Send the role data to the backend
    const response = await axios.post(import.meta.env.VITE_API_BASE_URL + '/roles', role.value)

    // Handle success response
    successMessage.value = 'Role created successfully!'
    role.value = { role_name: '', description: '' }
    emit('roleCreated')
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
textarea {
  margin-bottom: 10px;
  padding: 8px;
  width: 100%;
  border: solid white;
  border-radius: 0.5rem;
  width: 100%;
}

button {
  padding: 10px 20px;
  background-color: #4caf50;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 0.5rem;
}

button:hover {
  background-color: #45a049;
}
</style>
