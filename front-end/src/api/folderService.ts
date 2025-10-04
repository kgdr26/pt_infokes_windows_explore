// Definisikan tipe data folder
export interface Folder {
  tmf_id: number
  tmf_name: string
  tmf_description: string
  tmf_created_date: string
  tmf_mi_id: number
  mi_icon: string
}

// Tipe response dari API
export interface ApiResponse<T> {
  success: boolean
  data: T
}

const API_BASE = "http://localhost:3000/api"

export async function getFolders(): Promise<ApiResponse<Folder[]>> {
  try {
    const res = await fetch(`${API_BASE}/folder`)
    const data: ApiResponse<Folder[]> = await res.json()
    return data
  } catch (err) {
    console.error("Gagal ambil folders:", err)
    return { success: false, data: [] as Folder[] }
  }
}
