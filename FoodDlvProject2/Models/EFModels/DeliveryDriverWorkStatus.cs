﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class DeliveryDriverWorkStatus
    {
        public DeliveryDriverWorkStatus()
        {
            DeliveryDrivers = new HashSet<DeliveryDriver>();
        }

        public int Id { get; set; }
        public string Status { get; set; }

        public virtual ICollection<DeliveryDriver> DeliveryDrivers { get; set; }
    }
}