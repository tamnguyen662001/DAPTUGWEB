﻿using DAPTUGWEB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DAPTUGWEB.Controllers
{
    public class NhanVienController : Controller
    {
        ASP_QUAN_LY_SHOP_GIAY_6_6Entities db = new ASP_QUAN_LY_SHOP_GIAY_6_6Entities();
        // GET: NhanVien
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
        public ActionResult DangKy(NHANVIEN a)
        {
            if (ModelState.IsValid)
            {
                db.NHANVIENs.Add(a);
                db.SaveChanges();
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
            string sTendn = f["Tendnnv"].ToString();
            string sMk = f.Get("Mknv").ToString();
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(n => n.TENDN == sTendn && n.MK == sMk);
            //if (nv != null)
            //{

            //    ViewBag.ThongBao = "Đăng nhập thành công! Chào " + nv.TENNV;
            //    Session["Taikhoan"] = nv;
            //    //return View();
            //    //return RedirectToAction("SuaGioHang", "GioHang");
            //    return RedirectToAction("Index", "QuanLySanPham/Index");
            //}

            if (nv != null)
            {
                if(nv.QTV == false)
                {
                    ViewBag.ThongBao = "Đăng nhập thành công! Chào quản lí : " + nv.TENNV;
                    Session["Taikhoan"] = nv;
                    //return View();
                    //return RedirectToAction("SuaGioHang", "GioHang");
                    return RedirectToAction("Index", "QuanLySanPham/Index");
                }
                else
                {
                    ViewBag.ThongBao = "Đăng nhập thành công! Chào nhân viên : " + nv.TENNV;
                    Session["Taikhoan"] = nv;
                    return RedirectToAction("Index", "Home/Index");
                } 
            }
            ViewBag.ThongBao = "Tên tài khoản hoặc mật khẩu không đúng!";
            return View();

        }
    }
}