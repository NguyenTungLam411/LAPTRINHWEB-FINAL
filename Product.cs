using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebCompany.Models
{
    [Table("Products")]
    public class Product
    {
        [Key]
        public int ProductID { get; set; }

        [Required]
        [StringLength(200)]
        public string ProductName { get; set; }

        public int CategoryID { get; set; }

        [Required]
        public decimal Price { get; set; }

        public int Quantity { get; set; }
        public string ImageUrl { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; } = true;

        [ForeignKey("CategoryID")]
        public virtual Category Category { get; set; }
    }
}