using System;
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
    public class QuanLyHoaDonController : Controller
    {
        private ASP_QUAN_LY_SHOP_GIAYEntities db = new ASP_QUAN_LY_SHOP_GIAYEntities();

        // GET: QuanLyHoaDon
        public ActionResult Index()
        {
            var hOADONs = db.HOADONs.Include(h => h.KHACHHANG).Include(h => h.NHANVIEN).Include(h => h.THANHTOAN);
            return View(hOADONs.ToList());
        }

        // GET: QuanLyHoaDon/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADON hOADON = db.HOADONs.Find(id);
            if (hOADON == null)
            {
                return HttpNotFound();
            }
            return View(hOADON);
        }

        // GET: QuanLyHoaDon/Create
        public ActionResult Create()
        {
            ViewBag.MAKH = new SelectList(db.KHACHHANGs, "MAKH", "TENKH");
            ViewBag.MANV = new SelectList(db.NHANVIENs, "MANV", "TENNV");
            ViewBag.IDTHANHTOAN = new SelectList(db.THANHTOANs, "IDTHANHTOAN", "HTTHANHTOAN");
            return View();
        }

        // POST: QuanLyHoaDon/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MAHD,MANV,MAKH,TGDAT,TGGIAO,IDTHANHTOAN,DATHANHTOAN,DAGIAO")] HOADON hOADON)
        {
            if (ModelState.IsValid)
            {
                db.HOADONs.Add(hOADON);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MAKH = new SelectList(db.KHACHHANGs, "MAKH", "TENKH", hOADON.MAKH);
            ViewBag.MANV = new SelectList(db.NHANVIENs, "MANV", "TENNV", hOADON.MANV);
            ViewBag.IDTHANHTOAN = new SelectList(db.THANHTOANs, "IDTHANHTOAN", "HTTHANHTOAN", hOADON.IDTHANHTOAN);
            return View(hOADON);
        }

        // GET: QuanLyHoaDon/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADON hOADON = db.HOADONs.Find(id);
            if (hOADON == null)
            {
                return HttpNotFound();
            }
            ViewBag.MAKH = new SelectList(db.KHACHHANGs, "MAKH", "TENKH", hOADON.MAKH);
            ViewBag.MANV = new SelectList(db.NHANVIENs, "MANV", "TENNV", hOADON.MANV);
            ViewBag.IDTHANHTOAN = new SelectList(db.THANHTOANs, "IDTHANHTOAN", "HTTHANHTOAN", hOADON.IDTHANHTOAN);
            return View(hOADON);
        }

        // POST: QuanLyHoaDon/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MAHD,MANV,MAKH,TGDAT,TGGIAO,IDTHANHTOAN,DATHANHTOAN,DAGIAO")] HOADON hOADON)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hOADON).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MAKH = new SelectList(db.KHACHHANGs, "MAKH", "TENKH", hOADON.MAKH);
            ViewBag.MANV = new SelectList(db.NHANVIENs, "MANV", "TENNV", hOADON.MANV);
            ViewBag.IDTHANHTOAN = new SelectList(db.THANHTOANs, "IDTHANHTOAN", "HTTHANHTOAN", hOADON.IDTHANHTOAN);
            return View(hOADON);
        }

        // GET: QuanLyHoaDon/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADON hOADON = db.HOADONs.Find(id);
            if (hOADON == null)
            {
                return HttpNotFound();
            }
            return View(hOADON);
        }

        // POST: QuanLyHoaDon/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HOADON hOADON = db.HOADONs.Find(id);
            db.HOADONs.Remove(hOADON);
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
