﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class Qa
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public string Title { get; set; }
        public string Answer { get; set; }

        public virtual Qacategory Category { get; set; }
    }
}