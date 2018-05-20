using MvcBootstrap.Models.EntityFramwork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcBootstrap.Models.DataAcessLayer
{
    public class ContactDAL
    {
        FANMWDbContext db = null;
        public ContactDAL()
        {
            db = new FANMWDbContext();
        }

        public List<Contact> GetContact()
        {
            return db.Contacts.Where(x => x.Status == true).ToList();
        }

        public void Insert(Feedback feedback)
        {
            db.Feedbacks.Add(feedback);
            db.SaveChanges();
        }
    }
}