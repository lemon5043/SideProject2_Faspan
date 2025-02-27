﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace FoodDlvProject2.EFModels
{
    public partial class StorePrincipal
    {
        public StorePrincipal()
        {
            Stores = new HashSet<Store>();
        }

        public int Id { get; set; }
        [Display(Name = "帳號狀態")]
        public int AccountStatusId { get; set; }
        [Display(Name = "名字")]
        public string FirstName { get; set; }
        [Display(Name = "姓氏")]
        public string LastName { get; set; }
        [Display(Name = "電話")]
        public string Phone { get; set; }
        [Display(Name = "性別")]
        public bool Gender { get; set; }
        [Display(Name = "生日")]
        [DataType(DataType.Date)]
        public DateTime Birthday { get; set; }
        public string Email { get; set; }
        [Display(Name = "帳號")]
        public string Account { get; set; }
        [Display(Name = "密碼")]
        public string Password { get; set; }
        [Display(Name = "註冊時間")]
        public DateTime RegistrationTime { get; set; }
        [Display(Name = "帳號狀態")]
        public virtual AccountStatue AccountStatus { get; set; }
        public virtual ICollection<Store> Stores { get; set; }
    }
}