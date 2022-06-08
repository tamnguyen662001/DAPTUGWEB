using DAPTUGWEB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DAPTUGWEB.Controllers
{
    public class NguoiDungController : Controller
    {
        ASP_QUAN_LY_SHOP_GIAY_6_6Entities db = new ASP_QUAN_LY_SHOP_GIAY_6_6Entities();
        // GET: NguoiDung
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangKy(KHACHHANG a)
        {
            if (ModelState.IsValid)
            {
                db.KHACHHANGs.Add(a);
                db.SaveChanges();
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
           
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string sTendn = f["Tendn"].ToString();
            string sMk  = f.Get("Mk").ToString();
            KHACHHANG kh = db.KHACHHANGs.SingleOrDefault(n => n.TENDN == sTendn && n.MK == sMk);
            if (kh != null)
            {
                ViewBag.ThongBao = "Đăng nhập thành công! Chào " + kh.TENKH;
                Session["Taikhoan"] = kh;
                return RedirectToAction("Index","Home");
               // return View();
                
            }
                ViewBag.ThongBao = "Tên tài khoản hoặc mật khẩu không đúng!";
            return View();
           
        }
    }
}