﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvAPI.Models
{
    public partial class BenefitStandard
    {
        public int Id { get; set; }
        public int PerOrder { get; set; }
        public int PerMilage { get; set; }
        public int BonusThreshold1 { get; set; }
        public int BonusThreshold2 { get; set; }
        public int BonusThreshold3 { get; set; }
        public int Bouns1 { get; set; }
        public int Bouns2 { get; set; }
        public int Bouns3 { get; set; }
        public double HolidayBouns { get; set; }
        public double RushHoursBouns { get; set; }
        public TimeSpan RushHoursStart1 { get; set; }
        public TimeSpan RushHoursStart2 { get; set; }
        public TimeSpan RushHoursEnd1 { get; set; }
        public TimeSpan RushHoursEnd2 { get; set; }
        public bool Selected { get; set; }
    }
}