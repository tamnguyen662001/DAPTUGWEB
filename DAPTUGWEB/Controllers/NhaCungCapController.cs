using DAPTUGWEB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DAPTUGWEB.Controllers
{
    public class NhaCungCapController : Controller
    {
        ASP_QUAN_LY_SHOP_GIAY_6_6Entities db = new ASP_QUAN_LY_SHOP_GIAY_6_6Entities();
        // GET: SanPham
        public PartialViewResult NhaCungCapPartial()
        {
            var dsNhaCungCap = db.NHACCs.ToList();
            return PartialView(dsNhaCungCap);
        }
        public ViewResult SanPhamTheoNhaCungCap(string MANCC)
        {
            NHACC ncc = db.NHACCs.SingleOrDefault(n => n.MANCC == MANCC);
            if(ncc == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SANPHAM> dssp = db.SANPHAMs.Where(n => n.MANCC == MANCC).ToList();
            if(dssp.Count() == 0)
            {
                ViewBag.SANPHAM= "Không tồn tại sản phầm của hãng "+ncc.TENNCC;
            }
            return View(dssp);

            
        }
    }
}