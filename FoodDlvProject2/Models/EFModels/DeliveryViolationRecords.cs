﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class DeliveryViolationRecords
    {
        public long DeliveryDriversId { get; set; }
        public int ViolationId { get; set; }
        public long OrderId { get; set; }
        public DateTime ViolationDate { get; set; }

        public virtual DeliveryDrivers DeliveryDrivers { get; set; }
        public virtual Orders Order { get; set; }
        public virtual DeliveryViolationLists Violation { get; set; }
    }
}