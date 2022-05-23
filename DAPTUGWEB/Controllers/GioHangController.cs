using DAPTUGWEB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DAPTUGWEB.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        ASP_QUAN_LY_SHOP_GIAYEntities db = new ASP_QUAN_LY_SHOP_GIAYEntities();



        public List<GioHang> LayGioHang()
        {
            List<GioHang> dssp = Session["GioHang"] as List<GioHang>;
            if (dssp == null)
            {
                dssp = new List<GioHang>();
                Session["GioHang"] = dssp;

            }
            return dssp;
        }

        // them gio hang
        public ActionResult ThemGioHang(string maSP, string url)
        {
            SANPHAM sp = db.SANPHAMs.SingleOrDefault(n => n.MASP == maSP);
            if (sp == null)
            {
                Response.StatusCode = 404;

            }
            List<GioHang> dssp = LayGioHang();
            GioHang gh = dssp.Find(n => n.maSP == maSP);
            if (gh == null)
            {
                gh = new GioHang(maSP);
                return Redirect(url);

            }
            else
            {
                gh.soLuong++;
                return Redirect(url);

            }

        }

        // cap nhat
        public ActionResult CapNhatGioHang(string maSP, FormCollection f)
        {
            SANPHAM sp = db.SANPHAMs.SingleOrDefault(n => n.MASP == maSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            List<GioHang> dssp = LayGioHang();
            GioHang gh = dssp.SingleOrDefault(n => n.maSP == maSP);
            if (gh != null)
            {
                gh.soLuong = int.Parse(f["textSL"].ToString());


            }
            return View("GioHang");
        }

        // xoa gio hang
        public ActionResult XoaGioHang(string maSP)
        {
            SANPHAM sp = db.SANPHAMs.SingleOrDefault(n => n.MASP == maSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            List<GioHang> dssp = LayGioHang();
            GioHang gh = dssp.SingleOrDefault(n => n.maSP == maSP);
            if (gh != null)
            {
                dssp.RemoveAll(n => n.maSP == gh.maSP);

            }
            if(dssp.Count == 0)
            {
                return RedirectToAction("TrangChu", "Home");
            }
            return RedirectToAction("GioHang");

        }
        public ActionResult GioHang()
        {
           
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("TrangChu", "Home");
            }
            List<GioHang> dssp = LayGioHang();
            return View(dssp);
            
        }
        private int TongSoLuong()
        {
            int TongSL = 0;
            List<GioHang> dssp = Session["GioHang"] as List<GioHang>;
            if (dssp != null)
            {

                TongSL = dssp.Sum(n => n.soLuong);
            }
            return TongSL;

        }
        private double TongTien()
        {
            double TongTien = 0;
            List<GioHang> dssp = Session["GioHang"] as List<GioHang>;
            if (dssp != null)
            {

                TongTien = dssp.Sum(n => n.thanhTien);
            }
            return TongTien;

        }
    }
}