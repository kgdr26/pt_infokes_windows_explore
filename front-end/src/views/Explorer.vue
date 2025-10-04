<template>

    <div class="container-fluid">

        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between bg-transparent">
                    <h4 class="mb-sm-0">Explorer</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Explorer</a></li>
                            <li class="breadcrumb-item active">Windows Explorer</li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>

        <div class="email-wrapper d-lg-flex gap-1 mx-n4 mt-n4 p-1">
            <div class="email-menu-sidebar border">
                <div class="p-4 d-flex flex-column h-100">
                    <div class="pb-4 border-bottom border-bottom-dashed">
                        <button 
                            type="button" 
                            class="btn btn-success w-100"
                            @click="openModal = true"
                        >
                            <i class="ri-folder-5-fill"></i> <span data-key="ri-folder-5-fill">Add Master Folder</span>
                        </button>
                    </div>

                    <div class="mx-n4 px-4 email-menu-sidebar-scroll" data-simplebar>
                        <div class="mail-list mt-3">

                            <ul class="list-unstyled file-manager-menu" id="masterAccordion">
                                <li v-for="folder in folders" :key="folder.tmf_id">
                                    <!-- tombol utama -->
                                    <a
                                        data-bs-toggle="collapse"
                                        :href="'#collapse-' + folder.tmf_id"
                                        role="button"
                                        aria-expanded="false"
                                        :aria-controls="'collapse-' + folder.tmf_id"
                                        @click.prevent="selectFolder(folder.tmf_id)"
                                        :class="[
                                            'd-block px-2 py-1 rounded',
                                            { 'fw-bold text-success bg-light': activeFolder.type === 'master' && activeFolder.id === folder.tmf_id }
                                        ]"
                                        >
                                        <i :class="folder.mi_icon + ' align-bottom me-2'"></i>
                                        <span class="file-list-link">{{ folder.tmf_name }}</span>
                                    </a>

                                        <!-- turunan -->
                                        <div
                                            class="collapse"
                                            :id="'collapse-' + folder.tmf_id"
                                            data-bs-parent="#masterAccordion"
                                        >
                                        <ul class="sub-menu list-unstyled">
                                            <li v-for="child in folderChildren[folder.tmf_id] || []" :key="child.tcf_id">
                                            <a 
                                                href="#!" 
                                                @click.prevent="openFolder(child)" 
                                                :class="[
                                                    'd-block px-2 py-1 rounded',
                                                    { 'fw-bold text-primary bg-light': activeFolder.type === 'child' && activeFolder.id === child.tcf_id }
                                                ]"
                                                >
                                                <i class="ri-folder-2-line me-1"></i> {{ child.tcf_name }}
                                            </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>

                        </div>
                    </div>

                    <div class="mt-auto">
                        <h5 class="fs-13">1.75 GB of 10 GB used</h5>
                        <div class="progress progress-sm">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="email-content bg-transparent border">
                <div class="p-4 pb-0">
                    <div class="border-bottom border-bottom-dashed mb-3">
                        <div class="row mt-n2 mb-3">
                            <div class="col-auto">
                                <button type="button" class="btn btn-outline-secondary "><i class="ri-folder-add-fill"></i> <span data-key="ri-folder-add-fill">Add Folder</span></button>
                            </div>

                            <div class="col-auto">
                                <button type="button" class="btn btn-outline-warning "><i class=" ri-upload-cloud-fill"></i> <span data-key=" ri-upload-cloud-fill">Upload File</span></button>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div v-for="item in folderContents" :key="item.tcf_id" class="col-xxl-3 col-6 folder-card">
                            <div class="card bg-light shadow-none">
                                <div class="card-body">
                                    <div class="d-flex mb-1">
                                        <div class="dropdown">
                                            <button class="btn btn-ghost-primary btn-icon btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="ri-more-2-fill fs-16 align-bottom"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-end">
                                                <li>
                                                    <a class="dropdown-item" href="javascript:void(0);" @click="openFolder(item)">Open</a>
                                                </li>
                                                <li>
                                                    <a class="dropdown-item" href="javascript:void(0);" @click="renameFolder(item)">Rename</a>
                                                </li>
                                                <li>
                                                    <a class="dropdown-item" href="javascript:void(0);" @click="deleteFolder(item)">Delete</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <div class="mb-2">
                                            <i class="ri-folder-2-fill align-bottom text-warning display-5"></i>
                                        </div>
                                        <h6 class="fs-15 folder-name">{{ item.tcf_name }}</h6>
                                    </div>
                                    <div class="hstack mt-4 text-muted">
                                        <span class="me-auto">- Files</span>
                                        <span><b>{{ formatDate(item.tcf_created_date) }}</b></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div v-if="folderContents.length === 0" class="mt-2">
                            <!-- Info Alert -->
                            <div class="alert alert-info" role="alert">
                                <strong>There are no  </strong> folders or files available yet!
                            </div>
                        </div>

                    </div>

                </div>
                
            </div>
        </div>


    </div>
  
    <!-- Modal -->
    <AddFolderModal 
        :show="openModal" 
        @close="openModal = false" 
        @create="handleCreate"
    />
</template>

<script setup lang="ts">
    import { ref, onMounted } from "vue"
    import io from "socket.io-client"
    import { Folder } from "../api/folderService"
    import AddFolderModal from "../components/AddFolderModal.vue"

    const folders = ref<Folder[]>([])
    const openModal = ref(false)
    const folderContents = ref<any[]>([])
    const folderChildren = ref<Record<number, any[]>>({})
    const loadingFolderId = ref<number | null>(null)
    // ⬅️ Tambahin ini
    const activeFolderId = ref<number | null>(null)
    const activeFolder = ref<{ type: "master" | "child"; id: number | null }>({
        type: "master",
        id: null
    })

    // 🔌 koneksi ke socket server
    const socket = io("http://localhost:3000")

    onMounted(() => {
        socket.emit("getFolders")

        socket.on("folders", (data) => {
            folders.value = data

            // ✅ set folder pertama sebagai default aktif
            if (data.length > 0 && !activeFolderId.value) {
                activeFolderId.value = data[0].tmf_id
                // 🔥 langsung ambil isi folder pertama
                socket.emit("getFolderContents", activeFolderId.value)
            }
        })

        socket.on("folderAdded", (folder) => {
            folders.value.push(folder)

            // kalau belum ada folder aktif, set folder baru jadi aktif
            if (!activeFolderId.value) {
                activeFolderId.value = folder.tmf_id
            }
        })

        socket.on("folderContents", (data) => {
            // simpan untuk sidebar
            folderChildren.value[activeFolderId.value as number] = data

            // simpan juga untuk tampilan utama
            folderContents.value = data

            loadingFolderId.value = null
        })

        socket.on("folderContentsTurunan", (data) => {
            console.log("📂 Isi folder:", data)
            folderContents.value = data
        })
    })

    interface FolderFormData {
        name: string
        desc: string
        iconId: number | null
    }

    function handleCreate(data: FolderFormData) {
        // kirim ke BE untuk ditambah ke DB
        socket.emit("addFolder", {
            tmf_name: data.name,
            tmf_description: data.desc,
            tmf_mi_id: data.iconId,
        })
    }

    // ⬅️ fungsi buat ganti folder aktif pas klik
    function selectFolder(id: number) {
        activeFolder.value = { type: "master", id }
        loadingFolderId.value = id

        // ambil isi folder untuk sidebar
        socket.emit("getFolderContents", id)
    }

    // function format datetime
    function formatDate(dateString: string): string {
        const date = new Date(dateString)

        // mapping bulan dengan 4 huruf untuk 'Sept'
        const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
        
        const day = date.getDate().toString().padStart(2, '0')
        const month = monthNames[date.getMonth()]
        const year = date.getFullYear().toString().slice(-2)
        const hours = date.getHours().toString().padStart(2, '0')
        const minutes = date.getMinutes().toString().padStart(2, '0')

        return `${day} ${month} ${year} ${hours}:${minutes}`
    }

    // buka folder (tampilkan isi folder)
    function openFolder(item: any) {
        activeFolder.value = { type: "child", id: item.tcf_id }

        // pastikan item punya informasi tcf_turunan
        const nextLevel = (item.tcf_turunan || 1) + 1  

        // console.log(item.tcf_id,nextLevel);

        socket.emit("getFolderContentsTurunan", { 
            folderId: item.tcf_id, 
            level: nextLevel 
        })
    }

    // rename folder
    function renameFolder(item: any) {
        const newName = prompt("Rename folder:", item.tcf_name)
        // if (newName && newName !== item.tcf_name) {
        //     socket.emit("renameFolder", {
        //         tmf_id: item.tcf_id,
        //         tmf_name: newName
        //     })
        // }
    }

    // hapus folder
    function deleteFolder(item: any) {
        // if (confirm(`Are you sure you want to delete "${item.tcf_name}"?`)) {
        //     socket.emit("deleteFolder", item.tcf_id)
        //     // opsional: hapus dari folderContents sementara
        //     folderContents.value = folderContents.value.filter(f => f.tcf_id !== item.tcf_id)
        // }
    }
</script>
