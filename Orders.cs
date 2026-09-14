using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebCompany.Models
{
    [Table("Orders")]
    public class Order
    {
        [Key]
        public int OrderID { get; set; }
        public int? UserID { get; set; }

        [Required]
        public string CustomerName { get; set; }
        [Required]
        public string CustomerPhone { get; set; }
        [Required]
        public string CustomerAddress { get; set; }

        public DateTime OrderDate { get; set; } = DateTime.Now;
        public string Status { get; set; } = "Chờ xử lý";
        public decimal TotalAmount { get; set; }

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }

    [Table("OrderDetails")]
    public class OrderDetail
    {
        [Key]
        public int OrderDetailID { get; set; }
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }

        [ForeignKey("OrderID")]
        public virtual Order Order { get; set; }
        [ForeignKey("ProductID")]
        public virtual Product Product { get; set; }
    }
}