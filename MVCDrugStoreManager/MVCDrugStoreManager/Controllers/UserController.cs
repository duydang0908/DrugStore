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
    public class UserController : Controller
    {

        dbDrugStoreManagerDataContext data = new dbDrugStoreManagerDataContext();


        private List<SAN_PHAM> takeProduct(int count)
        {
            return data.SAN_PHAMs.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }

        // GET: User
        public ActionResult Index(int? page)
        {
            int pageSize = 5;
            int pageNum = (page ?? 1);
            var newProduct = takeProduct(15);
            return View(newProduct.ToPagedList(pageNum, pageSize));

            //var newProduct = takeProduct(6);
            //return View(newProduct);
        }

        public ActionResult Category()
        {
            var cate = from cd in data.LOAI_SAN_PHAMs select cd;
            return PartialView(cate);
        }
        
        public ActionResult productGroupByCetegory(int id)
        {
            var product = from s in data.SAN_PHAMs where s.MaLoaiSP == id select s;
            return View(product);
        }

        public ActionResult Details(int id)
        {
            var product = from s in data.SAN_PHAMs
                          where s.MaSP == id
                          select s;
            return View(product.Single());
        }

    }
}