using MvcBootstrap.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcBootstrap.Models.DataAcessLayer;
using MvcBootstrap.Models.ViewModel;

namespace MvcBootstrap.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Login(LoginModel user)
        {
            if(ModelState.IsValid)
            {
                var dal = new UserDAL();
                var isUser = dal.Login(user.UserName, user.Password);
                if(isUser)
                {
                    var userFull = dal.GetUser(user.UserName);
                    var userSession = new UserNameAndID();
                    userSession.ID = userFull.ID;
                    userSession.UserName = userFull.UserName;
                    Session.Add(CommonConstants.USER_SESSION,userSession);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("LoginState", "Username hoặc Password không đúng.");
                }
            }
            return View("Index");
        }
    }
}