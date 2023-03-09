﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class Member
    {
        public Member()
        {
            CreditCards = new HashSet<CreditCard>();
            Orders = new HashSet<Order>();
            Stores = new HashSet<Store>();
        }

        public int Id { get; set; }
        public int AccountStatusId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public int Balance { get; set; }
        public string Account { get; set; }
        public string Password { get; set; }
        public DateTime RegistrationTime { get; set; }

        public virtual AccountStatue AccountStatus { get; set; }
        public virtual Cart Cart { get; set; }
        //public virtual AccountAddress AccountAddress { get; set; }
        public virtual MemberViolationRecord MemberViolationRecord { get; set; }
        public virtual ICollection<CreditCard> CreditCards { get; set; }
        public virtual ICollection<Order> Orders { get; set; }

        public virtual ICollection<Store> Stores { get; set; }
    }
}