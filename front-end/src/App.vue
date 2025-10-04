<template>
  <!-- Begin page -->
  <div id="layout-wrapper">

    <Header @toggle-sidebar="toggleSidebar" />
    <!-- Sidebar -->
    <Sidebar />

    <!-- Vertical Overlay -->
    <div class="vertical-overlay" :class="{ 'show': isCollapsed }"></div>

    <div class="main-content">
      <div class="page-content">
        <router-view />
      </div>
      <Footer />
    </div>

  </div>

  <!-- Back to top -->
  <button @click="topFunction" class="btn btn-primary btn-icon" id="back-to-top">
    <i class="ri-arrow-up-line"></i>
  </button>

  <!-- Preloader -->
  <div id="preloader">
    <div id="status">
      <div class="spinner-border text-primary avatar-sm" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from "vue"
import Header from "./components/Header.vue"
import Sidebar from "./components/Sidebar.vue"
import Footer from "./components/Footer.vue"

const isCollapsed = ref(false)

function handleScroll() {
  const topbar = document.getElementById("page-topbar")
  if (!topbar) return

  if (window.scrollY >= 50) {
    topbar.classList.add("topbar-shadow")
  } else {
    topbar.classList.remove("topbar-shadow")
  }
}

onMounted(() => {
  window.addEventListener("scroll", handleScroll)
  handleScroll()
})

onUnmounted(() => {
  window.removeEventListener("scroll", handleScroll)
})

function topFunction() {
  window.scrollTo({ top: 0, behavior: "smooth" })
}

function toggleSidebar() {
  const width = document.documentElement.clientWidth
  const layout = document.documentElement.getAttribute("data-layout")

  // Toggle animasi hamburger
  document.querySelector(".hamburger-icon")?.classList.toggle("open")

  if (layout === "horizontal") {
    document.body.classList.toggle("menu")
  }

  if (layout === "vertical") {
    if (width <= 1025 && width > 767) {
      document.body.classList.remove("vertical-sidebar-enable")
      document.documentElement.setAttribute(
        "data-sidebar-size",
        document.documentElement.getAttribute("data-sidebar-size") === "sm" ? "" : "sm"
      )
    } else if (width > 1025) {
      document.body.classList.remove("vertical-sidebar-enable")
      document.documentElement.setAttribute(
        "data-sidebar-size",
        document.documentElement.getAttribute("data-sidebar-size") === "lg" ? "sm" : "lg"
      )
    } else if (width <= 767) {
      document.body.classList.add("vertical-sidebar-enable")
      document.documentElement.setAttribute("data-sidebar-size", "lg")
    }
  }

  if (layout === "semibox") {
    if (width > 767) {
      if (document.documentElement.getAttribute("data-sidebar-visibility") === "show") {
        document.documentElement.setAttribute(
          "data-sidebar-size",
          document.documentElement.getAttribute("data-sidebar-size") === "lg" ? "sm" : "lg"
        )
      } else {
        document.getElementById("sidebar-visibility-show")?.click()
        document.documentElement.setAttribute(
          "data-sidebar-size",
          document.documentElement.getAttribute("data-sidebar-size")
        )
      }
    } else {
      document.body.classList.add("vertical-sidebar-enable")
      document.documentElement.setAttribute("data-sidebar-size", "lg")
    }
  }

  if (layout === "twocolumn") {
    document.body.classList.toggle("twocolumn-panel")
  }
}
</script>

<style>
/* Tambahkan styling global kalau perlu */
</style>
