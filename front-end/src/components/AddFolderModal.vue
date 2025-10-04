<template>
  <div v-if="show">
    <!-- Modal -->
    <div class="modal fade show d-block" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header p-3 bg-light">
            <h5 class="modal-title">Add Folder</h5>
            <button type="button" class="btn-close" @click="closeModal"></button>
          </div>

          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label">Folder Name</label>
              <input
                v-model="folderName"
                type="text"
                class="form-control"
                placeholder="Folder Name"
              />
            </div>

            <div class="mb-3">
              <label class="form-label">Description</label>
              <textarea
                v-model="folderDesc"
                class="form-control"
                rows="5"
                placeholder="Folder description"
              ></textarea>
            </div>

            <div class="mb-3">
                <!-- Basic example -->
                 <label class="form-label">Select Icon</label>
                <div class="input-group">
                    <div v-if="selectedIcon" class="input-group-text">
                        <i :class="icons.find(i => i.mi_id === selectedIcon)?.mi_icon" style="font-size: 24px"></i>
                    </div>
                    <select v-model="selectedIcon" class="form-select">
                        <option :value="null">-- Pilih Icon --</option>
                        <option v-for="ic in icons" :key="ic.mi_id" :value="ic.mi_id">
                        {{ ic.mi_icon }}
                        </option>
                    </select>
                </div>
              

              <!-- Preview icon -->
              
            </div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-danger" @click="closeModal">
              Discard
            </button>
            <button type="button" class="btn btn-success" @click="createFolder">
              Create
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- backdrop -->
    <div class="modal-backdrop fade show"></div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";

// props
defineProps({ show: Boolean });
const emit = defineEmits(["close", "create"]);

// form fields
const folderName = ref("");
const folderDesc = ref("");
const selectedIcon = ref(null);

// icons list
const icons = ref([]);

async function fetchIcons() {
  try {
    const res = await fetch("http://localhost:3000/api/icon");
    const data = await res.json();
    if (data.success) {
      icons.value = data.data;
    //   console.log("✅ Icons loaded:", icons.value);
    } else {
    //   console.error("API error:", data.message);
    }
  } catch (err) {
    // console.error("❌ Gagal ambil icons:", err);
  }
}

onMounted(() => {
  fetchIcons();
});

function closeModal() {
  emit("close");
}

function createFolder() {
  emit("create", {
    name: folderName.value,
    desc: folderDesc.value,
    iconId: selectedIcon.value, // <== kirim ID icon ke parent
  });

  // ✅ reset form setelah submit
  folderName.value = ""
  folderDesc.value = ""
  selectedIcon.value = null
  
  emit("close");
}
</script>
