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
        dbDrugStoreManagerDataContext db = new dbDrugStoreManagerDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Drug(int? page)
        {
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 15;

            return View(db.SAN_PHAMs.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }
        [HttpGet]
        // Trang Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]

        // Trang Details
        public ActionResult Details()
        {
            return View();
        }

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

        public ActionResult Chitietsp(int id)
        {
            SAN_PHAM sp = db.SAN_PHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.Masach = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }

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
                s.MaLoaiSP = sp.MaLoaiSP;
                s.DVT = sp.DVT;
                s.SoLuongCon = sp.SoLuongCon;
                s.DonGia = sp.DonGia;
                s.Images = sp.Images;
                s.Ngaycapnhat = sp.Ngaycapnhat;
                db.SubmitChanges();
            }
            return RedirectToAction("Drug");
            
        }
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