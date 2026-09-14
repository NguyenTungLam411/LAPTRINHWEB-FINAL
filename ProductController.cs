using System.Linq;
using System.Web.Mvc;
using WebCompany.Models;

namespace WebCompany.Controllers
{
    public class ProductController : Controller
    {
        private readonly CompanyDbContext _db = new CompanyDbContext();

        // Danh sách sản phẩm (có lọc theo Danh mục & Tìm kiếm)
        public ActionResult Index(int? categoryId, string searchKeyword)
        {
            var query = _db.Products.Where(p => p.IsActive);

            if (categoryId.HasValue)
            {
                query = query.Where(p => p.CategoryID == categoryId.Value);
            }

            if (!string.IsNullOrEmpty(searchKeyword))
            {
                query = query.Where(p => p.ProductName.Contains(searchKeyword));
            }

            ViewBag.Categories = _db.Categories.ToList();
            return View(query.ToList());
        }

        // Chi tiết sản phẩm
        public ActionResult Details(int id)
        {
            var product = _db.Products.Find(id);
            if (product == null || !product.IsActive)
            {
                return HttpNotFound();
            }
            return View(product);
        }
    }
}