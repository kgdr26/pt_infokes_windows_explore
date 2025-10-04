<template>
  <li>
    <!-- tombol folder -->
    <a 
      href="#" 
      @click.prevent="selectThis"
      :class="[
        'd-block px-2 py-1 rounded',
        { 'fw-bold text-success bg-dark': isActive }
      ]"
    >
      <i class="ri-folder-2-line me-1"></i> 
      {{ node.tmf_name || node.tcf_name }}
    </a>

    <!-- render recursive kalau ada children -->
    <ul v-if="node.children && node.children.length > 0" class="list-unstyled ms-3">
      <FolderTree
        v-for="child in node.children"
        :key="child.tcf_id || child.tmf_id"
        :node="child"
        :active-folder="activeFolder"
        @select-folder="$emit('select-folder', $event)"
      />
    </ul>
  </li>
</template>

<script setup lang="ts">
import { computed } from "vue"

const props = defineProps<{
  node: any,
  activeFolder: { type: "master" | "child", id: number | null }
}>()

const emit = defineEmits(["select-folder"])

const isActive = computed(() =>
  (props.activeFolder.type === "master" && props.activeFolder.id === props.node.tmf_id) ||
  (props.activeFolder.type === "child" && props.activeFolder.id === props.node.tcf_id)
)

function selectThis() {
  emit("select-folder", props.node)
}
</script>
