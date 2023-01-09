﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FoodDlvProject2.EFModels
{
    public partial class DeliveryDriver
    {
        public DeliveryDriver()
        {
            DeliveryDriversRatings = new HashSet<DeliveryDriversRating>();
            DriverCancellationRecords = new HashSet<DriverCancellationRecord>();
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public int AccountStatusId { get; set; }
        public int WorkStatuseId { get; set; }
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
        public string Password { get; set; }
        public string DriverLicense { get; set; }
        public string Longitude { get; set; }
        public string Latitude { get; set; }

        public virtual AccountStatue AccountStatus { get; set; }
        public virtual DeliveryDriverWorkStatus WorkStatuse { get; set; }
        public virtual ICollection<DeliveryDriversRating> DeliveryDriversRatings { get; set; }
        public virtual ICollection<DriverCancellationRecord> DriverCancellationRecords { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}