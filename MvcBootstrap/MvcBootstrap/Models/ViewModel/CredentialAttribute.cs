using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBootstrap.Models.ViewModel
{
    public class CredentialAttribute : AuthorizeAttribute
    {
        public string RoleID { get; set; }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var session = (UserNameAndID)HttpContext.Current.Session[CommonConstants.USER_SESSION];
            if (session == null)
                return false;

            List<string> permission = this.GetCredentialByUserName(session.UserName);

            if (permission.Contains(this.RoleID))
                return true;
            else
                return false;
        }

        private List<string> GetCredentialByUserName(string userName)
        {
            return (List<string>)HttpContext.Current.Session[CommonConstants.CREDENTIALS_SESSION];
        }
    }
}