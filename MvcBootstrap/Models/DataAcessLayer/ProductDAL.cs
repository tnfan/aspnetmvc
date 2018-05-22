using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcBootstrap.Models.EntityFramwork;

namespace MvcBootstrap.Models.DataAcessLayer
{
    public class ProductDAL
    {
        FANMWDbContext db = null;
        public ProductDAL()
        {
            db = new FANMWDbContext();
        }

        public List<Product> GetListProductByCatId(int CatId=0)
        {
            var model = db.Products.Where(x => x.Status == true);
            if (CatId==0)
            {
                return model.ToList();
            }
            else
            {
                return model.Where(x=>x.CategoryID==CatId).ToList();
            }            
        }

        public void Add(Product product)
        {
            db.Products.Add(product);
            db.SaveChanges();
        }

        public List<ProductCategory> GetListProductCategory()
        {
            return db.ProductCategories.ToList();
        }

    }
}