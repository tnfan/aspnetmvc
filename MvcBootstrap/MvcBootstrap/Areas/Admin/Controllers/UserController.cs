using MvcBootstrap.Models.DataAcessLayer;
using MvcBootstrap.Models.EntityFramwork;
using MvcBootstrap.Models.ViewModel;
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
        [CredentialAttribute(RoleID = "VIEW_USER")]
        public ActionResult Index()
        {
            var model = new UserDAL().GetListUser();
            return View(model);
        }

        [CredentialAttribute(RoleID = "ADD_USER")]
        public ActionResult Create()
        {
            return View("");
        }

        [HttpPost]
        [CredentialAttribute(RoleID ="ADD_USER")]
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