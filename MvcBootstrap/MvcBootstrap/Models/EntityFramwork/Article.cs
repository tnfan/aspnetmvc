namespace MvcBootstrap.Models.EntityFramwork
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Article")]
    public partial class Article
    {
        public long ID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        public string Descriptions { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        public int? CategoryID { get; set; }

        [Column(TypeName = "ntext")]
        public string Details { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        public bool? Status { get; set; }

        public DateTime? TopHot { get; set; }

        public int? CountViews { get; set; }

        public int? Tags { get; set; }
    }
}
