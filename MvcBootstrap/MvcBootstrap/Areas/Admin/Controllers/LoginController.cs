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
            if (ModelState.IsValid)
            {
                var dal = new UserDAL();
                var isUser = dal.Login(user.UserName, user.Password,true);
                if (isUser == CommonConstants.ELoginSatus.IsAdmin)
                {
                    var userFull = dal.GetUser(user.UserName);
                    var userSession = new UserNameAndID();
                    userSession.ID = userFull.ID;
                    userSession.UserName = userFull.UserName;
                    Session.Add(CommonConstants.USER_SESSION, userSession);

                    var userCredentials = dal.GetListCredential(user.UserName);
                    Session.Add(CommonConstants.CREDENTIALS_SESSION, userCredentials);

                    return RedirectToAction("Index","Home");
                }
                else if (isUser == CommonConstants.ELoginSatus.InvalidPassword)
                    ModelState.AddModelError("", "Password không đúng.");

                else if (isUser == CommonConstants.ELoginSatus.InvallidUserName)
                    ModelState.AddModelError("", "UserName không đúng.");

                else if (isUser == CommonConstants.ELoginSatus.NotExistUser)
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");

                else if (isUser == CommonConstants.ELoginSatus.IsBlocked)
                    ModelState.AddModelError("", "Tài khoản bị khóa.");

                else
                    ModelState.AddModelError("", "Tài khoản này không có quyền quản trị website.");


            }
            return View("Index");
        }
    }
}