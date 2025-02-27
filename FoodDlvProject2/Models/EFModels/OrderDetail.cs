﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class OrderDetail
    {
        public OrderDetail()
        {
            OrderAssItems = new HashSet<OrderAssItem>();
        }

        public long Id { get; set; }
        public long OrderId { get; set; }
        public long ProductId { get; set; }
        public int UnitPrice { get; set; }
        public int Count { get; set; }
        public string CustomizationList { get; set; }

        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
        public virtual ICollection<OrderAssItem> OrderAssItems { get; set; }
    }
}