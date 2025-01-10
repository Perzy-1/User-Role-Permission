<template>
  <div class="role-list">
    <h2>Roles List</h2>
    <table>
      <thead>
        <tr>
          <th>Role Name</th>
          <th>Description</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="role in roles" :key="role.id">
          <td>{{ role.role_name }}</td>
          <td>{{ role.description }}</td>
          <td>
            <button @click="editRole(role.id)">Edit</button>
            <button @click="deleteRole(role.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>

    <RoleManager @roleCreated="fetchRoles" />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import axios from 'axios'
import RoleManager from './RoleManager.vue'

// Define the Role interface to type the roles data
interface Role {
  id: number
  role_name: string
  description: string
}

const roles = ref<Role[]>([]) // Set the type for roles as an array of Role objects

const fetchRoles = async () => {
  try {
    const response = await axios.get(import.meta.env.VITE_API_BASE_URL + '/roles')
    roles.value = response.data
  } catch (error) {
    console.error('Error fetching roles:', error)
  }
}

const editRole = (roleId: number) => {
  // Implement edit functionality if needed
}

const deleteRole = async (roleId: number) => {
  try {
    await axios.delete(import.meta.env.VITE_API_BASE_URL + `/roles/${roleId}`)
    fetchRoles() // Re-fetch the roles after deletion
  } catch (error) {
    console.error('Error deleting role:', error)
  }
}

onMounted(fetchRoles)
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
