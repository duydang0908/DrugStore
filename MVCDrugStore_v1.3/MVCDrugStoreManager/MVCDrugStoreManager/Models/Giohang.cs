using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCDrugStoreManager.Models;

namespace MVCDrugStoreManager.Models
{
    public class Giohang
    {
        dbDrugStoreManagerDataContext data = new dbDrugStoreManagerDataContext();
        public int iMaSP { get; set; }
        public string sTenSP  { get; set; }
        public string sHinh{ get; set; }
        public int iSoLuong { get; set; }
        public double dDonGia { get; set; }
        public double dThanhTien { get; set; }

        public Giohang(int MaSP)
        {
            iMaSP = MaSP;
            SAN_PHAM sp = data.SAN_PHAMs.Single(n => n.MaSP == iMaSP);
            sTenSP = sp.TenSP;
            sHinh = sp.Images;
            dDonGia = double.Parse(sp.DonGia.ToString());
            iSoLuong = 1;
        }
    }
}