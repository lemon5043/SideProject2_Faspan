﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using FoodDlvAPI.Models;

namespace FoodDlvAPI.EFModels
{
    public class AccountStatueDTO
    {
        public int Id { get; set; }
        public string Status { get; set; }
    }
    public static class AccountStatusExts
    {
        public static AccountStatueDTO ToEntity(this AccountStatue source)
        {
            return new AccountStatueDTO
            {
                Id = source.Id,
                Status = source.Status,
            };
        }
    }
}