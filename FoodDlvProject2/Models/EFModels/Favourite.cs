﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class Favourite
    {
        public int MemberId { get; set; }
        public int StoreId { get; set; }

        public virtual Member Member { get; set; }
        public virtual Store Store { get; set; }
    }
}