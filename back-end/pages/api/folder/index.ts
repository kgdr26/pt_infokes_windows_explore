import type { NextApiRequest, NextApiResponse } from 'next'
import { PrismaClient } from '@/generated/prisma'

const prisma = new PrismaClient()

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  // Tambahin header CORS di semua response
  res.setHeader("Access-Control-Allow-Origin", "*")
  res.setHeader("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS")
  res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization")

  // Handle preflight OPTIONS request
  if (req.method === "OPTIONS") {
    return res.status(200).end()
  }

  try {
    if (req.method === 'GET') {
      const folders = await prisma.trx_master_folder.findMany({
        include: {
          icon: {
            select: { mi_icon: true }
          }
        }
      })

      const result = folders.map(f => ({
        tmf_id: f.tmf_id,
        tmf_name: f.tmf_name,
        tmf_description: f.tmf_description,
        tmf_created_date: f.tmf_created_date,
        tmf_mi_id: f.tmf_mi_id,
        mi_icon: f.icon?.mi_icon ?? null
      }))

      return res.status(200).json({ success: true, data: result })
    }

    return res.status(405).json({ success: false, message: 'Method Not Allowed' })
  } catch (error) {
    console.error(error)
    return res.status(500).json({ success: false, message: 'Internal Server Error' })
  }
}
