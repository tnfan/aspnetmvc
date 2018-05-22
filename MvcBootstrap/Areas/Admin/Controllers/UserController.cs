using MvcBootstrap.Models.DataAcessLayer;
using MvcBootstrap.Models.EntityFramwork;
using MvcBootstrap.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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

        [CredentialAttribute(RoleID ="ADD_USER")]
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

        //[Authorize]
        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return RedirectToAction("Login", "Login");
        }

        [HttpGet]
        public ActionResult Edit(string id)
        {
            User model=null;
            if (id != null)
            {
                model = new UserDAL().GetUser(long.Parse(id));
                if (model==null)
                    return HttpNotFound();
            }
            else
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User user)
        {
            if(ModelState.IsValid)
            {
                new UserDAL().Update(user);
                return RedirectToAction("Index");
            }
            return View("Index");
        }

        //[HttpGet]
        //public ActionResult Delete(string id)
        //{

        //    if (id != null)
        //    {
        //        var dal = new UserDAL();
        //        var model = dal.GetUser(long.Parse(id));                
        //        if (model == null)
        //            return HttpNotFound();
        //        else
        //        {
        //            dal.Delete(model);
        //            return View("Index");
        //        }
        //    }
        //    else
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }

        //}

        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var user = new UserDAL().GetUser(int.Parse(id));
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var dal = new UserDAL();
            var user = dal.GetUser(id);
            dal.Delete(user);
            return RedirectToAction("Index");
        }

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            User user = new UserDAL().GetUser(int.Parse(id));
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

    }
}