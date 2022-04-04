using DAPTUGWEB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace DAPTUGWEB.Controllers
{
    public class HomeController : Controller
    {
        ASP_QUAN_LY_SHOP_GIAYEntities db = new ASP_QUAN_LY_SHOP_GIAYEntities();
        public ActionResult Index()
        {
            return View();
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