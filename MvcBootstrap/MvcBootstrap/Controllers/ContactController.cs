using MvcBootstrap.Models.DataAcessLayer;
using MvcBootstrap.Models.EntityFramwork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBootstrap.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult ContactInfo()
        {
            var model = new ContactDAL().GetContact();
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Feedback(Feedback feedback)
        {
            if(ModelState.IsValid)
            {
                var fb = new ContactDAL();
                fb.Insert(feedback);
                return View();
            }
            return View("Index");
        }
    }
}