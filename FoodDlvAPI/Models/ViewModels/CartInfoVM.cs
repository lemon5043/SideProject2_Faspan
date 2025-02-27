﻿using FoodDlvAPI.Models.DTOs;
using System.ComponentModel.DataAnnotations;

namespace FoodDlvAPI.Models.ViewModels
{
    public class CartInfoVM
    {
        /// <summary>
        /// View可能需要的資料
        /// </summary>
        [Display(Name = "會員編號")]
        public int MemberId { get; set; }

        [Display(Name = "會員姓名")]
        public string MemberName { get; set; }

        [Display(Name = "店家編號")]
        public int StoreId { get; set; }

        [Display(Name = "店家名稱")]
        public string StoreName { get; set; }

        [Display(Name = "產品總量")]
        public int Qty { get; set; }

        [Display(Name = "購物車總價")]
        public int Total { get; set; }

        [Display(Name = "產品明細")]
        public List<CartDetailVM>? CartDetails { get; set; }
        
    }

    public static partial class CartVMExts
    {
        public static CartInfoVM ToCartInfoVM(this CartDTO source)
        {
            var cartInfoVM = new CartInfoVM
            {
                MemberId = source.MemberId,
                MemberName = source.MemberName,
                StoreId = source.StoreId,
                StoreName = source.StoreName,
                Qty = source.DetailQty,
                Total = source.Total,
                CartDetails = source.Details.Select(d => d.ToCartDetailVM()).ToList(),
            };
            return cartInfoVM;
        }
                
        //public static CartDTO ToCartDTO(this CartVM source)
        //{
        //    var cartDTO = new CartDTO
        //    (
        //        source.RD_MemberId,
        //        source.RD_StoreId,
        //        details
        //    );
        //    return cartDTO;
        //}
    }
}
