﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvAPI.Models
{
    public partial class StoreCancellationRecord
    {
        public int Id { get; set; }
        public int CancellationId { get; set; }
        public long OrderId { get; set; }
        public int StoreId { get; set; }
        public DateTime CancellationDate { get; set; }

        public virtual StoreCancellationType Cancellation { get; set; }
        public virtual Order Order { get; set; }
        public virtual Store Store { get; set; }
    }
}