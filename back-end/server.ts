import { createServer } from "http"
import next from "next"
import { Server } from "socket.io"
import { PrismaClient } from "@/generated/prisma"

const prisma = new PrismaClient()
const dev = process.env.NODE_ENV !== "production"
const app = next({ dev })
const handle = app.getRequestHandler()

app.prepare().then(() => {
  const server = createServer((req, res) => {
    handle(req, res)
  })

  const io = new Server(server, {
    cors: {
      origin: "http://localhost:5173", // Vue frontend
      methods: ["GET", "POST"],
    },
  })

  io.on("connection", (socket) => {
    console.log("🔌 Client connected:", socket.id)

    // ✅ ambil semua folder
    socket.on("getFolders", async () => {
      try {
        const folders = await prisma.trx_master_folder.findMany({
          include: {
            icon: { select: { mi_icon: true } },
          },
        })

        // flatten biar FE enak pakai langsung
        const result = folders.map((f) => ({
          tmf_id: f.tmf_id,
          tmf_name: f.tmf_name,
          tmf_description: f.tmf_description,
          tmf_mi_id: f.tmf_mi_id,
          tmf_created_date: f.tmf_created_date,
          mi_icon: f.icon?.mi_icon || "",
        }))

        socket.emit("folders", result)
      } catch (err) {
        console.error("❌ Error ambil folders:", err)
        socket.emit("folders", [])
      }
    })

    // ✅ tambah folder baru
    socket.on("addFolder", async (data) => {
      try {
        const newFolder = await prisma.trx_master_folder.create({
          data: {
            tmf_name: data.tmf_name,
            tmf_description: data.tmf_description,
            tmf_mi_id: data.tmf_mi_id,
          },
          include: {
            icon: { select: { mi_icon: true } },
          },
        })

        const folderResult = {
          tmf_id: newFolder.tmf_id,
          tmf_name: newFolder.tmf_name,
          tmf_description: newFolder.tmf_description,
          tmf_mi_id: newFolder.tmf_mi_id,
          tmf_created_date: newFolder.tmf_created_date,
          mi_icon: newFolder.icon?.mi_icon || "",
        }

        // broadcast ke semua client supaya realtime
        io.emit("folderAdded", folderResult)
      } catch (err) {
        console.error("❌ Error tambah folder:", err)
      }
    })

    // ambil isi folder master (turunan pertama)
    socket.on("getFolderContents", async (folderId: number) => {
        try {
            const contents = await prisma.trx_content_folder.findMany({
            where: {
                tcf_id_folder: folderId,
                tcf_turunan: 1,
            },
            })

            socket.emit("folderContents", contents)
        } catch (err) {
            console.error("❌ Error ambil isi folder:", err)
            socket.emit("folderContents", [])
        }
    })

    // ambil isi folder turunan (level 2, 3, dst)
    socket.on("getFolderContentsTurunan", async ({ folderId, level }) => {
      try {
        // console.log("➡️ getFolderContentsTurunan", { folderId, level })

        const contents = await prisma.trx_content_folder.findMany({
          where: {
            tcf_id_folder: folderId,
            tcf_turunan: level,
          },
        })

        // console.log("📂 Hasil query:", contents)

        socket.emit("folderContentsTurunan", contents)
      } catch (err) {
        // console.error("❌ Error ambil isi folder turunan:", err)
        socket.emit("folderContentsTurunan", [])
      }
    })


    socket.on("disconnect", () => {
      console.log("❎ Client disconnected:", socket.id)
    })
  })

  const port = process.env.PORT || 3000
  server.listen(port, () => {
    console.log(`🚀 Server ready on http://localhost:${port}`)
  })
})
