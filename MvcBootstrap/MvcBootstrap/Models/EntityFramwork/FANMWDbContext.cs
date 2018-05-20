namespace MvcBootstrap.Models.EntityFramwork
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class FANMWDbContext : DbContext
    {
        public FANMWDbContext()
            : base("name=FANMWDbContext")
        {
        }

        public virtual DbSet<About> Abouts { get; set; }
        public virtual DbSet<Article> Articles { get; set; }
        public virtual DbSet<ArticleCategory> ArticleCategories { get; set; }
        public virtual DbSet<ArticleTag> ArticleTags { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<ContentTag> ContentTags { get; set; }
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<Footer> Footers { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<MenuType> MenuTypes { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<SlideHome> SlideHomes { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<About>()
                .Property(e => e.Name)
                .IsFixedLength();

            modelBuilder.Entity<About>()
                .Property(e => e.MetaTitle)
                .IsFixedLength();

            modelBuilder.Entity<About>()
                .Property(e => e.Descriptions)
                .IsFixedLength();

            modelBuilder.Entity<About>()
                .Property(e => e.Image)
                .IsFixedLength();

            modelBuilder.Entity<About>()
                .Property(e => e.Details)
                .IsFixedLength();

            modelBuilder.Entity<Feedback>()
                .Property(e => e.Phone)
                .IsFixedLength();

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.PromotionPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<User>()
                .Property(e => e.Phone)
                .IsFixedLength();
        }
    }
}
