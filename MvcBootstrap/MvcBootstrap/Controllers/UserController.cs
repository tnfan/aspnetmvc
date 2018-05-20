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
    }
}