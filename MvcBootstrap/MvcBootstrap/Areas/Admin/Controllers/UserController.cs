using MvcBootstrap.Models.DataAcessLayer;
using MvcBootstrap.Models.EntityFramwork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBootstrap.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            return View("");
        }

        [HttpPost]
        public ActionResult Create(User userEF)
        {
            if(ModelState.IsValid)
            {
                var userDAL = new UserDAL();
                long id = userDAL.Insert(userEF);
                if (id > 0)
                {
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm user thất bại.");
                }
            }
            return View("Index");

        }
    }
}