# CITIZEN FOR SOCIETY THAILAND
เว็บไซต์องค์กรพลเมืองเพื่อสังคม

## ดูเว็บไซต์ตัวอย่าง
เมื่อเปิดใช้งาน GitHub Pages แล้ว เว็บไซต์จะอยู่ที่:
https://suphanatmahintharaporn-design.github.io/citizen-for-society-thailand/

## สถานะปัจจุบัน
- มีหน้าเว็บไซต์ภาษาไทยแบบ responsive สำหรับหน้าแรก ข่าว ประกาศ โครงการ กิจกรรม คลังภาพ คำถามที่พบบ่อย คณะกรรมการ ตรวจสอบรายชื่อ และสมัครสมาชิก
- มีโครง backend Node.js/Express และโครงสร้างฐานข้อมูล PostgreSQL สำหรับรับสมัครสมาชิก
- มี GitHub Actions workflow สำหรับเผยแพร่หน้าเว็บไซต์แบบ static ผ่าน GitHub Pages
- **ระบบสมัครสมาชิกออนไลน์ยังต้องตั้งค่า API และฐานข้อมูลก่อนใช้งานจริง**
- ระบบตรวจสอบรายชื่อสมาชิกและระบบผู้ดูแลยังไม่เปิดใช้งาน และยังไม่มีระบบเข้าสู่ระบบผู้ดูแล

## เปิดเว็บไซต์ออนไลน์
1. เข้า Settings ของ repository นี้
2. เลือก Pages
3. ที่ Build and deployment ให้เลือก Source เป็น **GitHub Actions**
4. เปิดแท็บ Actions และรอ workflow ชื่อ “Deploy static website to GitHub Pages” ทำงานเสร็จ
5. เปิดลิงก์เว็บไซต์ตัวอย่างด้านบน

## โครงสร้าง
- `index.html` — หน้าเว็บสำหรับ GitHub Pages
- `frontend/index.html` — หน้าเว็บต้นฉบับ
- `backend/` — API สำหรับรับสมัครสมาชิก (ต้องมี Node.js และ PostgreSQL)
- `database/schema.sql` — โครงสร้างฐานข้อมูล
- `docker-compose.yml` — PostgreSQL สำหรับการทดสอบในเครื่อง
- `.env.example` — ตัวอย่างค่าตั้งต้น ห้ามใส่รหัสผ่านจริงลง GitHub

## ข้อควรระวัง
โปรดอย่าใช้ข้อมูลส่วนบุคคลจริงจนกว่าจะติดตั้ง HTTPS, ระบบยืนยันตัวตนและสิทธิ์ผู้ดูแล, นโยบายความเป็นส่วนตัว, การสำรองข้อมูล และทดสอบความปลอดภัยเรียบร้อยแล้ว
