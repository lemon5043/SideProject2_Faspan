﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvAPI.Models
{
    public partial class OrderStatue
    {
        public OrderStatue()
        {
            OrderSchedules = new HashSet<OrderSchedule>();
        }

        public int Id { get; set; }
        public string Status { get; set; }

        public virtual ICollection<OrderSchedule> OrderSchedules { get; set; }
    }
}