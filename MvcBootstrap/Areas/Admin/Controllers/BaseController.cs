using MvcBootstrap.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBootstrap.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var user = (UserNameAndID)Session[CommonConstants.USER_SESSION];
            if(user==null)
            {
                filterContext.Result = new RedirectToRouteResult
                (
                    new System.Web.Routing.RouteValueDictionary
                    (
                        new {Area="Admin",controller="Login",action="Index"}
                        )
                );
            }
            base.OnActionExecuting(filterContext);
        }
    }
}