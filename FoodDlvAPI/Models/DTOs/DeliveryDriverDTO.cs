﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using FoodDlvAPI.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace FoodDlvAPI.EFModels
{
    public partial class DeliveryDriverDTO
    {


        public int Id { get; set; }

        public int AccountStatusId { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Phone { get; set; }

        public bool Gender { get; set; }

        public string BankAccount { get; set; }

        public string Idcard { get; set; }

        public DateTime RegistrationTime { get; set; }

        public string VehicleRegistration { get; set; }

        public DateTime Birthday { get; set; }

        public string Email { get; set; }

        public string Account { get; set; }

        public string DriverLicense { get; set; }

        public double? DriverRating { get; set; }

    }
    public static class DeliveryDriverExts
    {
        public static DeliveryDriverDTO ToEntity(this DeliveryDriverDTO source)
        => new DeliveryDriverDTO
        {
            Id = source.Id,
            FirstName = source.FirstName,
            LastName = source.LastName,
            Phone = source.Phone,
            Gender = source.Gender,
            DriverRating = source.DriverRating,
        };
    }
}