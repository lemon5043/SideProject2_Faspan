﻿using FoodDlvAPI.Models;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace FoodDlvAPI.DTOs
{
    /// <summary>
    /// 提供購物車使用的商品類別與客製化資訊
    /// </summary>
    public class CartDetailDTO
    {
        public int Id { get; set; }
        public long ProductId { get; set; }
        public int Qty { get; set; }        
        public long CartId { get; set; }
        

        public CartDetailDTO(long productId, int qty, long cartId)
        {            
            this.ProductId = productId;
            this.Qty = qty;
            this.CartId = cartId;
        }

        public CartDetailDTO(int id ,long productId, int qty, long cartId)
        {             
            this.Id = id;
            this.ProductId = productId;
            this.Qty = qty;
            this.CartId = cartId;
        }       
    }

    public static partial class CartDetailExts
    {
        public static CartDetailDTO ToCartDetailDTO(this CartDetail source)
        {
            var toCartDetailDTO = new CartDetailDTO
            (                
                source.Id,
                source.ProductId,
                source.Qty,                
                source.CartId
            );
            return toCartDetailDTO;
        }

        public static CartDetail ToCartDetailEntity(this CartDetailDTO source)
        {
            var toCartDetailEntity = new CartDetail
            {                
                ProductId = source.ProductId,
                Qty = source.Qty,
                CartId = source.CartId,
            };
            return toCartDetailEntity;
        }
    }
}
