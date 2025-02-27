﻿using FoodDlvAPI.Interfaces;
using FoodDlvAPI.Models;
using FoodDlvAPI.Models.DTOs;
using FoodDlvAPI.Models.ViewModels;
using Microsoft.CodeAnalysis;
using Microsoft.EntityFrameworkCore;

namespace FoodDlvAPI.Models.Repositories
{
    public class ProductSelectionRepository : IProductSelectionRepository
    {
        //Fields
        private readonly AppDbContext _context;

        //Constructors
        public ProductSelectionRepository(AppDbContext context)
        {
            _context = context;
        }

        public ProductDTO GetProductSelection(long productId, bool? status)
        {
            var query = _context.Products
                .Include(p => p.ProductCustomizationItems)
                .SingleOrDefault(p => p.Id == productId && p.Status == status);
            if (query == null) throw new Exception("無此商品");
            if (status.HasValue && query.Status != status) throw new Exception("商品已下架");
            var product = query.ToProductDTO();

            return product;
        }
    }
}
