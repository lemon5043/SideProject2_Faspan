﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class StoreCancellations
    {
        public StoreCancellations()
        {
            StoreCancellationRecords = new HashSet<StoreCancellationRecords>();
        }

        public int Id { get; set; }
        public string Reason { get; set; }

        public virtual ICollection<StoreCancellationRecords> StoreCancellationRecords { get; set; }
    }
}