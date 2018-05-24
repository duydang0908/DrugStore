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
        // Chi tiết khách hàng
        public ActionResult Chitietkh(int id)
        {
            //Lấy ra đối tượng khách hàng theo mã
            KHACH_HANG kh = db.KHACH_HANGs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.Masach = kh.MaKH;
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
            ViewBag.Masach = kh.MaKH;
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
            ViewBag.Masach = kh.MaKH;
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.KHACH_HANGs.DeleteOnSubmit(kh);
            db.SubmitChanges();
            return RedirectToAction("Customers");
        }


        //Trang Đơn hàng
        public ActionResult PayBill(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 10;
            return View(db.CHI_TIET_DON_DAT_HANGs.ToList().OrderBy(n => n.MaDDH).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }
        //Trang hóa đơn
        public ActionResult Bill(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 10;
            return View(db.CT_HOA_DONs.ToList().OrderBy(n => n.MaHD).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }
        //Trang phiếu giao hàng
        public ActionResult Shipping(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 10;
            return View(db.CHI_TIET_PHIEU_GIAO_HANGs.ToList().OrderBy(n => n.MaPGH).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }

        //Trang nhân viên
        public ActionResult Employee(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 10;
            return View(db.NHAN_VIENs.ToList().OrderBy(n => n.MaNV).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }
        // Thêm nhân viên
        [HttpGet]
        public ActionResult Themmoinv()
        {
            ViewBag.MaLoaiNV = new SelectList(db.LOAI_NVs.ToList().OrderBy(n => n.LoaiNV), "MaLoaiNV", "LoaiNV");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoinv(NHAN_VIEN nv)
        {
            ViewBag.MaLoaiNV = new SelectList(db.LOAI_NVs.ToList().OrderBy(n => n.LoaiNV), "MaLoaiNV", "LoaiNV");
            //if (fileUpload == null)
            //{
            //    ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
            //    return View();
            //}
            //else
            //{
            if (ModelState.IsValid)
            {
                var s = db.NHAN_VIENs.SingleOrDefault(n => n.MaNV == nv.MaNV);
                //// Lưu tên file, lưu ý bổ sung thư viện using System.IO;
                //var fileName = Path.GetFileName(fileUpload.FileName);
                //// Lưu đường dẫn file
                //var path = Path.Combine(Server.MapPath("~/images"), fileName);
                //// Kiễm tra hình ảnh tồn tại
                //if (System.IO.File.Exists(path))
                //{
                //    ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                //}
                //else
                //{
                //    //Lưu hình ảnh vào đường dẫn
                //    fileUpload.SaveAs(path);
                //}
                //sp.Images = fileName;
                //// Lưu vào CSDL
                db.NHAN_VIENs.InsertOnSubmit(nv);
                db.SubmitChanges();
                //}
            }
            return RedirectToAction("Employee");
        }
        // Chi tiết nv
        public ActionResult Chitietnv(int id)
        {
            //Lấy ra đối tượng nv theo mã
            NHAN_VIEN nv = db.NHAN_VIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.Masach = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nv);
        }
        // Sửa thông tin nv
        [HttpGet]
        public ActionResult SuaNV(int id)
        {
            //Lấy ra đối tượng nv theo mã
            NHAN_VIEN nv = db.NHAN_VIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.Masach = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaLoaiNV = new SelectList(db.LOAI_NVs.ToList().OrderBy(n => n.LoaiNV), "MaLoaiNV", "LoaiNV");
            return View(nv);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaNV(NHAN_VIEN nv, HttpPostedFileBase fileupload)
        {
            ViewBag.MaLoaiNV = new SelectList(db.LOAI_NVs.ToList().OrderBy(n => n.LoaiNV), "MaLoaiNV", "LoaiNV");
            var s = db.NHAN_VIENs.SingleOrDefault(n => n.MaNV == nv.MaNV);
            if (ModelState.IsValid)
            {
                s.TenNV = s.TenNV;
                s.SDT = s.SDT;
                s.MaLoaiNV = s.MaLoaiNV;
                db.SubmitChanges();
            }
            return RedirectToAction("Employee");

        }
        // Xóa sản phẩm
        [HttpGet]
        public ActionResult XoaNV(int id)
        {
            //Lấy ra đối tượng nv theo mã
            NHAN_VIEN nv = db.NHAN_VIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.Masach = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nv);
        }
        [HttpPost, ActionName("Xoasp")]
        public ActionResult XacnhanxoaNV(int id)
        {
            //lấy ra đối tượng theo sản phẩm
            NHAN_VIEN nv = db.NHAN_VIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.Masach = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.NHAN_VIENs.DeleteOnSubmit(nv);
            db.SubmitChanges();
            return RedirectToAction("Employee");
        }

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
            ViewBag.Masach = sp.MaSP;
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
            ViewBag.Masach = sp.MaSP;
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
            ViewBag.Masach = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.SAN_PHAMs.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("Drug");
        }

    }

}