﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class ComplaintStatus
    {
        public ComplaintStatus()
        {
            AppealRecords = new HashSet<AppealRecord>();
        }

        public int Id { get; set; }
        public string Status { get; set; }

        public virtual ICollection<AppealRecord> AppealRecords { get; set; }
    }
}