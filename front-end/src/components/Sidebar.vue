<template>
  <!-- ========== App Menu ========== -->
  <div class="app-menu navbar-menu">
      <!-- LOGO -->
      <div class="navbar-brand-box">
          <!-- Dark Logo-->
          <a href="#" class="logo logo-dark">
              <span class="logo-sm">
                  <img :src="sideLS" alt="" height="22">
              </span>
              <span class="logo-lg">
                  <img :src="sideLD" alt="" height="17">
              </span>
          </a>
          <!-- Light Logo-->
          <a href="#" class="logo logo-light">
              <span class="logo-sm">
                  <img :src="sideLS" alt="" height="22">
              </span>
              <span class="logo-lg">
                  <img :src="sideLL" alt="" height="17">
              </span>
          </a>
          <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
              <i class="ri-record-circle-line"></i>
          </button>
      </div>

      <div id="scrollbar">
        <div class="container-fluid">
            <div id="two-column-menu">
            </div>
            <ul class="navbar-nav" id="navbar-nav">
                <li class="nav-item">
                    <router-link to="/home" class="nav-link" data-key="t-main-calender">
                        <i class="ri-home-4-line"></i> <span data-key="ri-home-4-line">Home</span>
                    </router-link>
                </li>

                <li class="nav-item">
                    <router-link to="/explorer" class="nav-link" data-key="t-main-calender">
                        <i class="ri-folder-5-fill"></i> <span data-key="ri-folder-5-fill">Explorer</span>
                    </router-link>
                </li>

            </ul>
        </div>
        <!-- Sidebar -->
      </div>

      <div class="sidebar-background"></div>
  </div>
  <!-- Left Sidebar End -->
</template>

<script setup>
  import sideLS from "../assets/images/logo-sm.png"
  import sideLD from "../assets/images/logo-dark.png"
  import sideLL from "../assets/images/logo-light.png"

</script>

<style scoped>

</style>