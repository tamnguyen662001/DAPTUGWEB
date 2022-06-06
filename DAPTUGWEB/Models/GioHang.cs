using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DAPTUGWEB.Models
{
    public class GioHang
    {
        public string maSP { get; set; }

        public string tenSP { get; set; }
        public double donGia { get; set; }
        public int soLuong { get; set; }
        public string anhSP { get; set; }
        public double thanhTien
        {
            get { return soLuong * donGia; }
        }

        ASP_QUAN_LY_SHOP_GIAY_6_6Entities db = new ASP_QUAN_LY_SHOP_GIAY_6_6Entities();
        public GioHang(string MaSP)
        {
            maSP = MaSP;
            SANPHAM sp = db.SANPHAMs.Single(n => n.MASP == maSP);
            tenSP = sp.TENSP;
            donGia = double.Parse(sp.DONGIA.ToString());
            soLuong = 1;
            anhSP = sp.ANHSP;

        }
    }
}