using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcBootstrap.Models.ViewModel
{
    public static class CommonConstants
    {
        public static string USER_SESSION = "USER_SESSION";

        public static string CREDENTIALS_SESSION = "CREDENTIALS_SESSION";

        public static string ADMIN_GROUP = "ADMIN";
        public static string MOD_GROUP = "MOD";
        public static string MEMBER_FROUP= "MEMBER";

        public enum ELoginSatus
        {
            InvalidPassword,
            InvallidUserName,
            NotExistUser,
            NotAccessAdmin,
            IsBlocked,
            IsAdmin,
            IsMember
        }

        public const string ROOT_IMAGE_PRODUCT = "~/Stores/Images/Products/";
    }
}