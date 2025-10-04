import { createRouter, createWebHistory } from 'vue-router'
import Explorer from '../views/Explorer.vue'

const routes = [
  { 
    path: "/", 
    redirect: "/explorer" 
  },
  {
    path: '/explorer/:folderId?',
    name: 'Explorer',
    component: Explorer,
    props: true, // biar folderId bisa dipakai di component
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
