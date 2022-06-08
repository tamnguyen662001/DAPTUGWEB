using DAPTUGWEB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;


namespace DAPTUGWEB.Controllers
{
    public class HomeController : Controller
    {
        ASP_QUAN_LY_SHOP_GIAY_6_6Entities db = new ASP_QUAN_LY_SHOP_GIAY_6_6Entities();

        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;

            var dssp = (from l in db.SANPHAMs select l).OrderBy(x => x.MASP);
            int pageSize = 6;
            int pageumber = (page ?? 1);

            return View(dssp.ToPagedList(pageumber,pageSize));
            //return View(db.SANPHAMs.Where(n=>n.SLTON > 20).ToList().OrderBy(n => n.DONGIA).ToPagedList(pageumber, pageSize));
        }

       

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Login()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}