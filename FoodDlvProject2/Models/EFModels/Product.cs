﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FoodDlvProject2.EFModels
{
    public partial class Product
    {
        public Product()
        {
            Carts = new HashSet<Cart>();
            InverseCustomizationValueNavigation = new HashSet<Product>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public long Id { get; set; }
        public int StoreId { get; set; }
		[Required]
		[StringLength(50)]
		public string ProductName { get; set; }
        public byte[] Photo { get; set; }
		
		[StringLength(100)]
		public string ProductContent { get; set; }

		[Required]
		
		public bool Status { get; set; }
        public long? CustomizationValue { get; set; }

        public virtual Product CustomizationValueNavigation { get; set; }
        public virtual Store Store { get; set; }
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<Product> InverseCustomizationValueNavigation { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}