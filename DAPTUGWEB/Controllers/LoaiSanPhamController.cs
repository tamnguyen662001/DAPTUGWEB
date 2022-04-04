using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAPTUGWEB.Models;

namespace DAPTUGWEB.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        // GET: LoaiSanPham

        ASP_QUAN_LY_SHOP_GIAYEntities db = new ASP_QUAN_LY_SHOP_GIAYEntities();
        public PartialViewResult LoaiSanPhamPartial()
        {
            var dsLoaiSP = db.LOAISPs.ToList();
            //var dsLoaiSP = db.LOAISPs.Take(3);
            return PartialView(dsLoaiSP);
        }
        public ViewResult SanPhamTheoLoai(string MALSP)
        {
            LOAISP lsp = db.LOAISPs.SingleOrDefault(n => n.MALSP == MALSP);
            if (lsp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SANPHAM> dssp = db.SANPHAMs.Where(n => n.MALSP == MALSP).ToList();
            if (dssp.Count() == 0)
            {
                ViewBag.SANPHAM = "Không tồn tại sản phầm của loại sản phẩm " + lsp.TENLSP;
            }
            return View(dssp);


        }
    }
}