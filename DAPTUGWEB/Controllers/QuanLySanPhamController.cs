﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DAPTUGWEB.Models;

namespace DAPTUGWEB.Controllers
{
    public class QuanLySanPhamController : Controller
    {
        private ASP_QUAN_LY_SHOP_GIAY_6_6Entities db = new ASP_QUAN_LY_SHOP_GIAY_6_6Entities();

        // GET: QuanLySanPham

        string LayMaSP()
        {
            var maMax = db.SANPHAMs.ToList().Select(n => n.MASP).Max();
            int maNV = int.Parse(maMax.Substring(2)) + 1;
            string NV = String.Concat("000", maNV.ToString());
            return "SP" + NV.Substring(maNV.ToString().Length - 1);
        }
        public ActionResult Index()
        {
            var sANPHAMs = db.SANPHAMs.Include(s => s.LOAISP).Include(s => s.NHACC);
            return View(sANPHAMs.ToList());
        }

        // GET: QuanLySanPham/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // GET: QuanLySanPham/Create
        public ActionResult Create()
        {
            ViewBag.MaSP = LayMaSP();
            ViewBag.MALSP = new SelectList(db.LOAISPs, "MALSP", "TENLSP");
            ViewBag.MANCC = new SelectList(db.NHACCs, "MANCC", "TENNCC");
            return View();
            
        }

        // POST: QuanLySanPham/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MASP,MALSP,TENSP,DVT,KICHTHUOC,DONGIA,MANCC,SLTON,CHITIETSP,ANHSP")] SANPHAM sANPHAM)
        {
            //System.Web.HttpPostedFileBase Avatar;
            var imgSP = Request.Files["Avatar"];    
            //Lấy thông tin từ input type=file có tên Avatar
            string postedFileName = System.IO.Path.GetFileName(imgSP.FileName);
            //Lưu hình đại diện về Server
            var path = Server.MapPath("/Image/" + postedFileName);
            imgSP.SaveAs(path);
            if (ModelState.IsValid)
            {
                sANPHAM.MASP = LayMaSP();
                sANPHAM.ANHSP = postedFileName;
                db.SANPHAMs.Add(sANPHAM);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MALSP = new SelectList(db.LOAISPs, "MALSP", "TENLSP", sANPHAM.MALSP);
            ViewBag.MANCC = new SelectList(db.NHACCs, "MANCC", "TENNCC", sANPHAM.MANCC);
            return View(sANPHAM);
        }

        // GET: QuanLySanPham/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            ViewBag.MALSP = new SelectList(db.LOAISPs, "MALSP", "TENLSP", sANPHAM.MALSP);
            ViewBag.MANCC = new SelectList(db.NHACCs, "MANCC", "TENNCC", sANPHAM.MANCC);
            return View(sANPHAM);
        }

        // POST: QuanLySanPham/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MASP,MALSP,TENSP,DVT,KICHTHUOC,DONGIA,MANCC,SLTON,CHITIETSP,ANHSP")] SANPHAM sANPHAM)
        {
            var imgSP = Request.Files["Avatar"];
            try
            {
                //Lấy thông tin từ input type=file có tên Avatar
                string postedFileName = System.IO.Path.GetFileName(imgSP.FileName);
                //Lưu hình đại diện về Server
                var path = Server.MapPath("/Image/" + postedFileName);
                imgSP.SaveAs(path);
            }
            catch
            { }
            if (ModelState.IsValid)
            {
                db.Entry(sANPHAM).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MALSP = new SelectList(db.LOAISPs, "MALSP", "TENLSP", sANPHAM.MALSP);
            ViewBag.MANCC = new SelectList(db.NHACCs, "MANCC", "TENNCC", sANPHAM.MANCC);
            return View(sANPHAM);
        }

        // GET: QuanLySanPham/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // POST: QuanLySanPham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            db.SANPHAMs.Remove(sANPHAM);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
