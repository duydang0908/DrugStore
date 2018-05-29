using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDrugStoreManager.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace MVCDrugStoreManager.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        dbDrugStoreManagerDataContext db = new dbDrugStoreManagerDataContext();
        public ActionResult Index()
        {
            return View();
        }
        // Trang Sản phẩm
        public ActionResult Drug(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 6;
            return View(db.SAN_PHAMs.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }
        //Trang loại sản phẩm
        public ActionResult Category(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 10;
            return View(db.LOAI_SAN_PHAMs.ToList().OrderBy(n => n.MaLoaiSP).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }
        //Trang khách hàng 
        public ActionResult Customers(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 10;
            return View(db.KHACH_HANGs.ToList().OrderBy(n => n.MaKH).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }
        //Trang đơn đặt hàng
        public ActionResult PayBill(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 10;
            return View(db.CHI_TIET_DON_DAT_HANGs.ToList().OrderBy(n => n.MaDDH).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }
        // Trang hóa đơn



        // Trang Login
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                DangNhap dn = db.DangNhaps.SingleOrDefault(n => n.Username == tendn && n.Pass == matkhau);
                if (dn != null)
                {
                    Session["Taikhoanadmin"] = dn;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }

        //----------------- Sản phẩm -----------------//
        // Thêm sản phẩm
        [HttpGet]
        public ActionResult Themmoisp()
        {
            ViewBag.MaLoaiSP = new SelectList(db.LOAI_SAN_PHAMs.ToList().OrderBy(n => n.TenLoai), "MaLoaiSP", "TenLoai");
            ViewBag.DVT = new SelectList(db.DVTs.ToList().OrderBy(n => n.TenDVT), "MaDVT", "TenDVT");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoisp(SAN_PHAM sp, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaLoaiSP = new SelectList(db.LOAI_SAN_PHAMs.ToList().OrderBy(n => n.TenLoai), "MaLoaiSP", "TenLoai");
            ViewBag.DVT = new SelectList(db.DVTs.ToList().OrderBy(n => n.TenDVT), "MaDVT", "TenDVT");
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    // Lưu tên file, lưu ý bổ sung thư viện using System.IO;
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    // Lưu đường dẫn file
                    var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    // Kiễm tra hình ảnh tồn tại
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        //Lưu hình ảnh vào đường dẫn
                        fileUpload.SaveAs(path);
                    }
                    sp.Images = fileName;
                    // Lưu vào CSDL
                    db.SAN_PHAMs.InsertOnSubmit(sp);
                    db.SubmitChanges();
                }
            }
            return RedirectToAction("Drug");
        }
        // Chi tiết sản phẩm
        public ActionResult Chitietsp(int id)
        {
            //Lấy ra đối tượng sản phẩm theo mã
            SAN_PHAM sp = db.SAN_PHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }
        // Sửa sản phẩm
        [HttpGet]
        public ActionResult Suasp(int id)
        {
            //lấy ra đối tượng theo sách
            SAN_PHAM sp = db.SAN_PHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaLoaiSP = new SelectList(db.LOAI_SAN_PHAMs.ToList().OrderBy(n => n.TenLoai), "MaLoaiSP", "TenLoai");
            ViewBag.DVT = new SelectList(db.DVTs.ToList().OrderBy(n => n.TenDVT), "MaDVT", "TenDVT");
            return View(sp);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasp(SAN_PHAM sp, HttpPostedFileBase fileupload)
        {
            ViewBag.MaLoaiSP = new SelectList(db.LOAI_SAN_PHAMs.ToList().OrderBy(n => n.TenLoai), "MaLoaiSP", "TenLoai");
            ViewBag.DVT = new SelectList(db.DVTs.ToList().OrderBy(n => n.TenDVT), "MaDVT", "TenDVT");
            var s = db.SAN_PHAMs.SingleOrDefault(n => n.MaSP == sp.MaSP);
            if (ModelState.IsValid)
            {
                s.TenSP = sp.TenSP;
                //s.LOAI_SAN_PHAM.TenLoai = sp.LOAI_SAN_PHAM.TenLoai;
                //s.DVT1.TenDVT = sp.DVT1.TenDVT;
                s.MaLoaiSP = sp.MaLoaiSP;
                s.DVT = sp.DVT;
                s.SoLuongTon = sp.SoLuongTon;
                s.DonGia = sp.DonGia;
                s.Images = sp.Images;
                s.MoTa = sp.MoTa;
                s.NgayCapNhat = sp.NgayCapNhat;
                db.SubmitChanges();
            }
            return RedirectToAction("Drug");

        }
        // Xóa sản phẩm
        [HttpGet]
        public ActionResult Xoasp(int id)
        {
            SAN_PHAM sp = db.SAN_PHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);

        }
        [HttpPost, ActionName("Xoasp")]
        public ActionResult Xacnhanxoa(int id)
        {
            //lấy ra đối tượng theo sản phẩm
            SAN_PHAM sp = db.SAN_PHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.SAN_PHAMs.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("Drug");
        }

        //----------------- Khách hàng -----------------//
        // Chi tiết khách hàng
        public ActionResult Chitietkh(int id)
        {
            //Lấy ra đối tượng khách hàng theo mã
            KHACH_HANG kh = db.KHACH_HANGs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.MaKH = kh.MaKH;
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(kh);
        }
        // Xóa khách hàng
        [HttpGet]
        public ActionResult Xoakh(int id)
        {
            //Lấy ra đối tượng khách hàng theo mã
            KHACH_HANG kh = db.KHACH_HANGs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.MaKH = kh.MaKH;
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(kh);

        }
        [HttpPost, ActionName("Xoakh")]
        public ActionResult Xacnhanxoakh(int id)
        {
            //lấy ra đối tượng theo kh
            KHACH_HANG kh = db.KHACH_HANGs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.MaKH = kh.MaKH;
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.KHACH_HANGs.DeleteOnSubmit(kh);
            db.SubmitChanges();
            return RedirectToAction("Customers");
        }

        //----------------- Loại sản phẩm -----------------//
        // Thêm sản phẩm
        [HttpGet]
        public ActionResult Themmoiloaisp()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoiloaisp(LOAI_SAN_PHAM loaisp)
        {
            if (ModelState.IsValid)
            {
                // Lưu vào CSDL
                db.LOAI_SAN_PHAMs.InsertOnSubmit(loaisp);
                db.SubmitChanges();
            }
            return RedirectToAction("Category");
        }
        // Sửa sản phẩm
        [HttpGet]
        public ActionResult Sualoaisp(int id)
        {
            //lấy ra đối tượng theo sách
            LOAI_SAN_PHAM loaisp = db.LOAI_SAN_PHAMs.SingleOrDefault(n => n.MaLoaiSP == id);
            ViewBag.MaLoaiSP = loaisp.MaLoaiSP;
            if (loaisp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(loaisp);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Sualoaisp(LOAI_SAN_PHAM loaisp)
        {
            var s = db.LOAI_SAN_PHAMs.SingleOrDefault(n => n.MaLoaiSP == loaisp.MaLoaiSP);
            if (ModelState.IsValid)
            {
                s.TenLoai = loaisp.TenLoai;
                db.SubmitChanges();
            }
            return RedirectToAction("Category");

        }
        // Xóa sản phẩm
        [HttpGet]
        public ActionResult Xoaloaisp(int id)
        {
            LOAI_SAN_PHAM loaisp = db.LOAI_SAN_PHAMs.SingleOrDefault(n => n.MaLoaiSP == id);
            ViewBag.MaLoaiSP = loaisp.MaLoaiSP;
            if (loaisp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(loaisp);

        }
        [HttpPost, ActionName("Xoaloaisp")]
        public ActionResult Xacnhanxoaloaisp(int id)
        {
            //lấy ra đối tượng theo sản phẩm
            LOAI_SAN_PHAM loaisp = db.LOAI_SAN_PHAMs.SingleOrDefault(n => n.MaLoaiSP == id);
            ViewBag.MaLoaiSP = loaisp.MaLoaiSP;
            if (loaisp == null) 
            {
                Response.StatusCode = 404;
                return null;
            }
            db.LOAI_SAN_PHAMs.DeleteOnSubmit(loaisp);
            db.SubmitChanges();
            return RedirectToAction("Category");
        }
    }
}