using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcBootstrap.Models.EntityFramwork;
using MvcBootstrap.Models.ViewModel;

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

        /// <summary>
        /// TRẢ VỀ THÔNG BÁO VIỆC ĐĂNG NHẬP CÓ THÀNH CÔNG HAY KHÔNG
        /// </summary>
        /// <param name="UserName"></param>
        /// <param name="Password"></param>
        /// <param name="isLoginAdmin">Có phải đăng nhập vào Area Admin hay không?</param>
        /// <returns></returns>
        public CommonConstants.ELoginSatus Login(string UserName, string Password, bool isLoginAdmin = false)
        {
            var user = db.Users.SingleOrDefault(x => x.UserName == UserName);
            if (user == null)
                return CommonConstants.ELoginSatus.NotExistUser;
            else
            {
                if (isLoginAdmin)
                {
                    if (user.GroupID == CommonConstants.ADMIN_GROUP || user.GroupID == CommonConstants.MOD_GROUP)
                    {
                        if (user.Status == false)
                            return CommonConstants.ELoginSatus.IsBlocked;
                        else
                        {
                            if (user.Password == Password)
                                return CommonConstants.ELoginSatus.IsAdmin;
                            else
                                return CommonConstants.ELoginSatus.InvalidPassword;
                        }
                    }
                    else
                        return CommonConstants.ELoginSatus.NotAccessAdmin;

                }
                else
                {
                    if (user.Status == false)
                        return CommonConstants.ELoginSatus.IsBlocked;
                    else
                    {
                        if (user.Password == Password)
                            return CommonConstants.ELoginSatus.IsMember;
                        else
                            return CommonConstants.ELoginSatus.InvalidPassword;
                    }
                }
            }

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

        public List<string> GetListCredential(string userName)
        {
            var user = db.Users.SingleOrDefault(x => x.UserName == userName);
            var rolesForUserGroup =
                (from cre in db.Credentials
                join ug in db.UserGroups on cre.GroupID equals ug.ID
                join role in db.Roles on cre.RoleID equals role.ID
                where ug.ID == user.GroupID
                select new
                {
                    RoleID = cre.RoleID,
                    GroupID = cre.GroupID
                }).AsEnumerable().Select(x=>new Credential()
                {
                    RoleID = x.RoleID,
                    GroupID = x.GroupID
                });
            return rolesForUserGroup.Select(x=>x.RoleID).ToList() ;
        }

        public List<User> GetListUser()
        {
            return db.Users.ToList();
        }
    }
}