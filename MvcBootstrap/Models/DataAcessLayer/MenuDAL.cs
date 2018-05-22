using MvcBootstrap.Models.EntityFramwork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcBootstrap.Models.DataAcessLayer
{
    public class MenuDAL
    {
        FANMWDbContext db = null;
        public MenuDAL()
        {
            db = new FANMWDbContext();
        }

        public List<Menu> ListMenuByTypeId(int menuType)
        {            
            return db.Menus.Where(x => x.TypeID == menuType &&x.Status==true).OrderBy(x=>x.DisplayOrder).ToList();
        }
    }
}