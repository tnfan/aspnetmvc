using MvcBootstrap.Models.DataAcessLayer;
using MvcBootstrap.Models.EntityFramwork;
using MvcBootstrap.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBootstrap.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserViewModel user)
        {
            if(ModelState.IsValid)
            {
                if(new UserDAL().CheckUserName(user.UserName))
                {
                    ModelState.AddModelError("", "Tên người dùng đã tồn tại. Vui lòng chọn tên khác.");

                }
                else if(new UserDAL().CheckEmail(user.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại. Vui lòng chọn tên khác.");
                }
                else
                {
                    User userFull = new User();
                    userFull.UserName = user.UserName;
                    userFull.Password = user.Password;
                    userFull.Email = user.Email;
                    userFull.Phone = user.Phone;
                    userFull.Address = user.Address;
                    userFull.CreatedDate = DateTime.Now;
                    var dal = new UserDAL();
                    var result = dal.Insert(userFull);
                    if(result>0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        user = new UserViewModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công.");
                    }
                }

            }
            return View(user);
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginViewModel user)
        {
            if (ModelState.IsValid)
            {
                var dal = new UserDAL();
                var isUser = dal.Login(user.UserName, user.Password);
                if (isUser == CommonConstants.ELoginSatus.IsMember || isUser == CommonConstants.ELoginSatus.IsAdmin)
                {
                    var userFull = dal.GetUser(user.UserName);
                    var userSession = new UserNameAndID();
                    userSession.ID = userFull.ID;
                    userSession.UserName = userFull.UserName;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index","Home");
                }
                else if (isUser == CommonConstants.ELoginSatus.InvalidPassword)
                {
                    ModelState.AddModelError("", "Password không đúng.");
                }
                else if (isUser == CommonConstants.ELoginSatus.InvallidUserName)
                {
                    ModelState.AddModelError("", "UserName không đúng.");
                }
                else if (isUser == CommonConstants.ELoginSatus.NotExistUser)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (isUser == CommonConstants.ELoginSatus.IsBlocked)
                {
                    ModelState.AddModelError("", "Tài khoản bị khóa.");
                }

            }
            return View();
        }


        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect(Request.UrlReferrer.ToString());
        }

        [ChildActionOnly]
        public ActionResult TopBar()
        {
            var userNameAndId = (UserNameAndID)Session[CommonConstants.USER_SESSION];
            return PartialView(userNameAndId);
        }
    }
}