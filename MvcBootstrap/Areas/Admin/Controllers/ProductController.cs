using MvcBootstrap.Models.DataAcessLayer;
using MvcBootstrap.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcBootstrap.Models.EntityFramwork;

namespace MvcBootstrap.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index()
        {
            var model = new ProductDAL().GetListProductByCatId(0);
            return View(model);
        }

        [HttpGet]
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(ProductViewModel product)
        {
            if(ModelState.IsValid)
            {
                var fileName = Path.GetFileNameWithoutExtension(product.ImageFile.FileName);
                var extension = Path.GetExtension(product.ImageFile.FileName);
                fileName = fileName + "-" + DateTime.Now.ToString("yyyyMMddHHmmss") + extension; // ko bị lỗi khi bị trùng tên file.
                                                                                                 //product.Image = fileName;
                product.ImageFile.SaveAs(Path.Combine(Server.MapPath("~/Stores/Images/Products/"), fileName)); //lưu lên server

                Product fullProduct = new Product();
                fullProduct.Image = fileName;
                fullProduct.CreatedDate = DateTime.Now;
                fullProduct.CreatedBy = ((UserNameAndID)Session[CommonConstants.USER_SESSION]).UserName;

                fullProduct.CategoryID = product.CategoryID;
                fullProduct.Descriptions = product.Descriptions;
                fullProduct.Details = product.Details;
                fullProduct.IncludeVAT = product.IncludeVAT;
                fullProduct.MetaDescriptions = product.MetaDescriptions;
                fullProduct.MetaKeywords = product.MetaKeywords;
                fullProduct.MetaTitle = product.MetaTitle;
                fullProduct.Name = product.Name;
                fullProduct.Price = product.Price;
                fullProduct.Quantity = product.Quantity;
                fullProduct.Status = product.Status;
                //fullProduct.TopHot = product.TopHot;

                new ProductDAL().Add(fullProduct);

            }
            return RedirectToAction("Index");


        }

        [ChildActionOnly]
        public ActionResult GetCatNameFromCatId()
        {
            var model = new ProductDAL().GetListProductCategory();
            return PartialView(model);
        }
    }
}