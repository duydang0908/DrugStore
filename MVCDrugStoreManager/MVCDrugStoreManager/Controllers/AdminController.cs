using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDrugStoreManager.Models;

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

        // Trang Login
        public ActionResult Login()
        {
            return View();
        }

        // Trang Details
        public ActionResult Details()
        {
            return View();
        }
    }
}