<template>
  <div class="user-list">
    <h2>Users List</h2>
    <table>
      <thead>
        <tr>
          <th>Full Name</th>
          <th>Email</th>
          <th>Role</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.full_name }}</td>
          <td>{{ user.email }}</td>
          <td>{{ user.role }}</td>
          <td>
            <button @click="editUser(user.id)">Edit</button>
            <button @click="deleteUser(user.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- UserCreationForm component with event listener -->
    <UserCreationForm @userCreated="fetchUsers" />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'
import UserCreationForm from '../components/UserCreationForm.vue'

// Define the User type
interface User {
  id: number
  full_name: string
  email: string
  role: string
}

// Define the users array with the correct type
const users = ref<User[]>([])
const router = useRouter()

const fetchUsers = async () => {
  try {
    const response = await axios.get(import.meta.env.VITE_API_BASE_URL + '/users')
    users.value = response.data
  } catch (error) {
    console.error('Error fetching users:', error)
  }
}

const editUser = (userId: number) => {
  router.push(`/users/edit/${userId}`)
}

const deleteUser = async (userId: number) => {
  try {
    await axios.delete(import.meta.env.VITE_API_BASE_URL + `/users/${userId}`)
    fetchUsers() // Re-fetch the users after deletion
  } catch (error) {
    console.error('Error deleting user:', error)
  }
}

onMounted(fetchUsers)
</script>

<style scoped>
table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  padding: 8px;
  text-align: left;
  border: 1px solid #ddd;
}

button {
  margin-right: 10px;
}
</style>
