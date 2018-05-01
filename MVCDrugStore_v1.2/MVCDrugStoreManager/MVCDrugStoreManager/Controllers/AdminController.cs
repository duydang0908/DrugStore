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
            int pageSize = 5;
            return View(db.SAN_PHAMs.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
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
        public ActionResult Themmoisp(SAN_PHAM sp, HttpPostedFileBase fileupload)
        {
            ViewBag.MaLoaiSP = new SelectList(db.LOAI_SAN_PHAMs.ToList().OrderBy(n => n.TenLoai), "MaLoaiSP", "TenLoai");
            ViewBag.DVT = new SelectList(db.DVTs.ToList().OrderBy(n => n.TenDVT), "MaDVT", "TenDVT");
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    // Lưu tên file, lưu ý bổ sung thư viện using System.IO;
                    var fileName = Path.GetFileName(fileupload.FileName);
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
                        fileupload.SaveAs(path);
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
            ViewBag.MaLoaiSP = new SelectList(db.LOAI_SAN_PHAMs.ToList().OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "MaLoaiSP");
            ViewBag.DVT = new SelectList(db.DVTs.ToList().OrderBy(n => n.MaDVT), "MaDVT", "MaDVT");
            return View(sp);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasp(SAN_PHAM sp, HttpPostedFileBase fileupload)
        {
            ViewBag.MaLoaiSP = new SelectList(db.LOAI_SAN_PHAMs.ToList().OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "MaLoaiSP");
            ViewBag.DVT = new SelectList(db.DVTs.ToList().OrderBy(n => n.MaDVT), "MaDVT", "MaDVT");
            var s = db.SAN_PHAMs.SingleOrDefault(n => n.MaSP == sp.MaSP);
            if (ModelState.IsValid)
            {

                s.TenSP = sp.TenSP;
                s.MaLoaiSP = sp.MaLoaiSP;
                s.DVT = sp.DVT;
                s.SoLuongTon = sp.SoLuongTon;
                s.DonGia = sp.DonGia;
                s.Images = sp.Images;
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