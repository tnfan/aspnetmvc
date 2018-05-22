using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MvcBootstrap.Models.ViewModel
{
    public class ProductViewModel
    {
        [Key]
        public long ID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        public string Descriptions { get; set; }

        //[StringLength(250)]
        //public string Image { get; set; }

        public HttpPostedFileBase ImageFile { get; set; }

        [Column(TypeName = "xml")]
        public string MoreImages { get; set; }

        public decimal? Price { get; set; }

        public bool? IncludeVAT { get; set; }

        public int? Quantity { get; set; }

        public int? CategoryID { get; set; }

        [Column(TypeName = "ntext")]
        public string Details { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        public bool? Status { get; set; }

        //public DateTime? TopHot { get; set; }
    }
}