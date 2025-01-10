<template>
  <div class="user-form">
    <h2>Edit User</h2>
    <form @submit.prevent="handleUpdate">
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
        <input type="password" id="password" v-model="user.password" />
      </div>

      <div>
        <label for="role">Role</label>
        <input type="text" id="role" v-model="user.role" required />
      </div>

      <button type="submit">Update User</button>

      <!-- Display error message if there is one -->
      <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
      <p v-if="successMessage" class="success">{{ successMessage }}</p>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'

const route = useRoute()
const router = useRouter()

const user = ref({
  full_name: '',
  email: '',
  password: '',
  role: '',
})

const errorMessage = ref('')
const successMessage = ref('')

const fetchUser = async () => {
  try {
    const response = await axios.get(
      import.meta.env.VITE_API_BASE_URL + `/users/${route.params.id}`,
    )
    user.value = response.data
  } catch (error) {
    console.error('Error fetching user:', error)
  }
}

const handleUpdate = async () => {
  try {
    errorMessage.value = ''
    successMessage.value = ''

    const response = await axios.put(
      import.meta.env.VITE_API_BASE_URL + `/users/${route.params.id}`,
      user.value,
    )
    successMessage.value = 'User updated successfully'
    user.value = { full_name: '', email: '', password: '', role: '' } // Reset form
    router.push('/users') // Redirect to the user list
  } catch (error: any) {
    errorMessage.value = error.response?.data?.message || 'Something went wrong!'
  }
}

onMounted(fetchUser)
</script>

<style scoped>
.error {
  color: red;
}

.success {
  color: green;
}

input {
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
</style>
