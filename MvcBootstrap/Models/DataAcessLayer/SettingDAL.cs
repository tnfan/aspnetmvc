using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcBootstrap.Models.EntityFramwork;

namespace MvcBootstrap.Models.DataAcessLayer
{
    public class SettingDAL
    {
        FANMWDbContext db = null;
        public SettingDAL()
        {
            db = new FANMWDbContext();
        }

        public List<Menu> GetListMenu()
        {
            return db.Menus.ToList();
        }
    }
}