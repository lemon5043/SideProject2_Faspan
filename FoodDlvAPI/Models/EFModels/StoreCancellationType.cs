﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvAPI.Models
{
    public partial class StoreCancellationType
    {
        public StoreCancellationType()
        {
            StoreCancellationRecords = new HashSet<StoreCancellationRecord>();
        }

        public int Id { get; set; }
        public string Reason { get; set; }
        public string Content { get; set; }

        public virtual ICollection<StoreCancellationRecord> StoreCancellationRecords { get; set; }
    }
}