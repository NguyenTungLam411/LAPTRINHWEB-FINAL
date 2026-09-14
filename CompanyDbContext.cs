using System.Data.Entity;

namespace WebCompany.Models
{
    public class CompanyDbContext : DbContext
    {
        public CompanyDbContext() : base("name=CompanyDbContext") { }

        public DbSet<Role> Roles { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<News> News { get; set; }
    }
}