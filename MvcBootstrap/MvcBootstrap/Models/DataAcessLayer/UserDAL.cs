using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcBootstrap.Models.EntityFramwork;

namespace MvcBootstrap.Models.DataAcessLayer
{
    public class UserDAL
    {
        FANMWDbContext db = null;
        public UserDAL()
        {
            db = new FANMWDbContext();
        }

        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public bool Login(string UserName, string Password)
        {
            var user = db.Users.SingleOrDefault(x => x.UserName == UserName && x.Password == Password);
            if (user != null)
                return true;
            else
                return false;
        }

        public User GetUser(long ID)
        {
            return db.Users.Single(x => x.ID == ID);
        }

        public User GetUser(string userName)
        {
            return db.Users.Single(x => x.UserName == userName);
        }

        public bool CheckUserName(string userName)
        {
            return db.Users.Count(x => x.UserName == userName) > 0; //exsit username in Db
        }

        public bool CheckEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) > 0;
        }
    }
}