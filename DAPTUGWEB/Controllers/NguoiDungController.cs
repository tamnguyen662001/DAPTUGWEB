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
        ASP_QUAN_LY_SHOP_GIAYEntities db = new ASP_QUAN_LY_SHOP_GIAYEntities();
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
        public ActionResult DangKy(KHACHHANG a)
        {
            db.KHACHHANGs.Add(a);
            db.SaveChanges();
            return View();
        }

        public ActionResult DangNhap()
        {
            return View();
        }
    }
}