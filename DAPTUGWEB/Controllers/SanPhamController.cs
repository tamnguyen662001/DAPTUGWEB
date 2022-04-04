using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAPTUGWEB.Models;

namespace DAPTUGWEB.Controllers
{
    public class SanPhamController : Controller
    {
        ASP_QUAN_LY_SHOP_GIAYEntities db = new ASP_QUAN_LY_SHOP_GIAYEntities();
        // GET: SanPham
        public PartialViewResult SanPhamPartial()
        {
            var dsSanPham = db.SANPHAMs.ToList();
            return PartialView(dsSanPham);
        }
        public ViewResult ChiTietSanPham (String MASP)
        {
            SANPHAM sp = db.SANPHAMs.SingleOrDefault(n => n.MASP == MASP);
            if(sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }

    }
}