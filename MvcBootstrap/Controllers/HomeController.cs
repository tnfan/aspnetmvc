using MvcBootstrap.Models.DataAcessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBootstrap.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly] //Chỉ được gọi thông qua Home, ko gọi trực tiếp.
        public ActionResult MainMenu()
        {
            var model = new MenuDAL().ListMenuByTypeId(1).ToList(); //main menu
            return PartialView(model);
        }

        [ChildActionOnly] //Chỉ được gọi thông qua Home, ko gọi trực tiếp.
        public ActionResult CatMenu()
        {
            var model = new ProductDAL().GetListProductCategory(); //main menu
            return PartialView(model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}