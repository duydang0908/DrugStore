using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDrugStoreManager.Models;
using PagedList;
using PagedList.Mvc;

namespace MVCDrugStoreManager.Controllers
{

    public class DrugStoreController : Controller
    {
        dbDrugStoreManagerDataContext db = new dbDrugStoreManagerDataContext();
        // GET: DrugStore
        private List<SAN_PHAM> Layspmoi(int count)
        {
            return db.SAN_PHAMs.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }

        //  Trang index
        public ActionResult Index(int ? page, string searchString)
        {
            var sp = from e in db.SAN_PHAMs select e;
            if (!String.IsNullOrEmpty(searchString))
            {
                sp = sp.Where(s => s.TenSP.Contains(searchString));
            }
            ViewBag.SeachString = searchString;
            //tạo bien so trang
            int pageNumber = (page ?? 1);
            //tao bien quy dinh so san pham tren moi trang
            int pageSize = 8; 
            return View(sp.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber, pageSize));
            //return View(db.SAN_PHAMs.ToList());
        }

        public ActionResult loaiSP()
        {
            var cate = from cd in db.LOAI_SAN_PHAMs select cd;
            return PartialView(cate);
        }

        public ActionResult spTheoLoai(int id)
        {
            var product = from s in db.SAN_PHAMs where s.MaLoaiSP == id select s;
            return View(product);
        }

        public ActionResult Details(int id)
        {
            var product = from s in db.SAN_PHAMs
                          where s.MaSP == id
                          select s;
            return View(product.Single());
        }

        public ActionResult DDHofKH()
        {
            var ddh = from d in db.KHACH_HANGs select d.MaKH;
            return PartialView(ddh);
        }
        public ActionResult CTDDH(int id)
        {
            var ddh = from d in db.KHACH_HANGs select d;
            return PartialView(ddh);
        }
    }
}