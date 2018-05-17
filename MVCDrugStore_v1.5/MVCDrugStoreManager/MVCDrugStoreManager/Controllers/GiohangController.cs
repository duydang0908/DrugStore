using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDrugStoreManager.Models;

namespace MVCDrugStoreManager.Controllers
{
    public class GiohangController : Controller
    {
        dbDrugStoreManagerDataContext data = new dbDrugStoreManagerDataContext();
        // GET: Giohang
        public ActionResult Index()
        {
            return View();
        }

        // Lấy giỏ hàng
        public List<Giohang> Laygiohang()
        {
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang == null)
            {
                //Nếu giỏ hàng chưa tồn tại thì khởi tạo listGiohang
                lstGiohang = new List<Giohang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }

        // Thêm hàng vào giỏ
        public ActionResult ThemGiohang(int iMaSP, string strURL)
        {
            //  Lấy ra Session giỏ hàng
            List<Giohang> lstGiohang = Laygiohang();
            // Kiểm tra sách này tồn tại trong Session["Giohang"] chưa ?
            Giohang sanpham = lstGiohang.Find(n => n.iMaSP == iMaSP);
            if (sanpham == null)
            {
                sanpham = new Giohang(iMaSP);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iSoLuong++;
                return Redirect(strURL);
            }
        }

        // Tổng số lượng
        public int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;
        }

        // Tính tổng tiền
        private double TongTien()
        {
            double iTongTien = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhTien);
            }
            return iTongTien;
        }

        // Trang giỏ hàng
        public ActionResult GioHang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "DrugStore");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }

        // Tạo Partial View để hiển thị thông tin giỏ hàng
        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }

        // Xóa giỏ hàng
        public ActionResult XoaGiohang(int iMaSP)
        {
            // Lấy giỏ hàng từ Session
            List<Giohang> lstGiohang = Laygiohang();
            // Kiểm tra sản phẩm đã có trong Session["Giohang"]
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.iMaSP == iMaSP);
            // Nếu tồn tại thì cho sửa số lượng
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.iMaSP == iMaSP);
                return RedirectToAction("GioHang");
            }
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "DrugStore");
            }
            return RedirectToAction("GioHang");
        }

        // Xóa tất cả giỏ hàng
        public ActionResult XoaTatcaGiohang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("Index", "DrugStore");
        }

        //Cập nhật giỏ hàng
        public ActionResult CapnhatGiohang(int iMaSP, FormCollection f)
        {
            // Lấy giỏ hàng từ Session
            List<Giohang> lstGiohang = Laygiohang();
            // Kiểm tra sản phẩm đã có trong Session["Giohang"]
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.iMaSP == iMaSP);
            // Nếu tồn tại thì cho sửa SoLuong
            if (sanpham != null)
            {
                sanpham.iSoLuong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("Giohang");
        }

        // Hiển thị View DatHang để cập nhật các thông tin cho Đơn hàng
        [HttpGet]
        public ActionResult DatHang()
        {
            //Kiểm tra đăng nhập
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Dangnhap","User");
            }
            if (Session["Giohang"] == null)
            {
                return RedirectToAction("DatHang", "GioHang");
            }

            //Lấy giỏ hàng từ Session
            List<Giohang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();

            return View(lstGiohang);
        }
        //[HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            DON_DAT_HANG ddh = new DON_DAT_HANG();
            PHIEU_GIAO_HANG pgh = new PHIEU_GIAO_HANG();
            KHACH_HANG kh = (KHACH_HANG)Session["Taikhoan"];
            List<Giohang> gh = Laygiohang();
            ddh.NgayLapDon = DateTime.Now;
            pgh.GhiChu = pgh.GhiChu;
            data.PHIEU_GIAO_HANGs.InsertOnSubmit(pgh);
            data.DON_DAT_HANGs.InsertOnSubmit(ddh);
            data.SubmitChanges();
            foreach(var item in gh)
            {
                CHI_TIET_DON_DAT_HANG ctdh = new CHI_TIET_DON_DAT_HANG();
                ctdh.MaDDH = ddh.MaDDH;
                ctdh.MaSP = item.iMaSP;
                ctdh.SoLuong = item.iSoLuong;
                ctdh.DonGia = (decimal)item.dDonGia;
                data.CHI_TIET_DON_DAT_HANGs.InsertOnSubmit(ctdh);
                data.SubmitChanges();
            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("Xacnhandonhang", "Giohang");
        }

        // Xác nhận đơn hàng
        public ActionResult Xacnhandonhang()
        {
            return View();
        }
    }
}