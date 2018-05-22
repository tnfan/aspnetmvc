using MvcBootstrap.Models.DataAcessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBootstrap.Areas.Admin.Controllers
{
    public class SettingController : BaseController
    {
        // GET: Admin/Setting
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AddMenu()
        {
            var model = new SettingDAL().GetListMenu();
            return View();
        }
    }
}