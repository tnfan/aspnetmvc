using MvcBootstrap.Models.DataAcessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBootstrap.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            var model = new ProductDAL().GetListProductByCatId(0);
            return View(model);
        }
    }
}