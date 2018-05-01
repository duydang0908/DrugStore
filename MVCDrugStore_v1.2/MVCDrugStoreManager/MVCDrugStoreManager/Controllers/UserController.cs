using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDrugStoreManager.Models;
namespace MVCDrugStoreManager.Controllers
{
    public class UserController : Controller
    {
        dbDrugStoreManagerDataContext db = new dbDrugStoreManagerDataContext();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
    }
}