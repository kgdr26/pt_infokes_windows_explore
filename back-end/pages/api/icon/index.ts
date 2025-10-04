import type { NextApiRequest, NextApiResponse } from "next";
import { PrismaClient } from "@/generated/prisma";

const prisma = new PrismaClient();

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  // ✅ Tambah CORS header
  res.setHeader("Access-Control-Allow-Origin", "http://localhost:5173");
  res.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
  res.setHeader("Access-Control-Allow-Headers", "Content-Type");

  // ✅ Untuk OPTIONS preflight
  if (req.method === "OPTIONS") {
    return res.status(200).end();
  }

  try {
    const icons = await prisma.mst_icon.findMany({
      select: { mi_id: true, mi_icon: true },
    });

    res.status(200).json({ success: true, data: icons });
  } catch (err) {
    console.error("❌ Error get icons:", err);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
}
