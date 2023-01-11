﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace FoodDlvProject2.EFModels
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
        {
        }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AccountAddress> AccountAddresses { get; set; }
        public virtual DbSet<AccountStatue> AccountStatues { get; set; }
        public virtual DbSet<Cart> Carts { get; set; }
        public virtual DbSet<CartCustomizationItem> CartCustomizationItems { get; set; }
        public virtual DbSet<CommonReply> CommonReplies { get; set; }
        public virtual DbSet<CreditCard> CreditCards { get; set; }
        public virtual DbSet<DeliveryDriver> DeliveryDrivers { get; set; }
        public virtual DbSet<DeliveryDriverWorkStatus> DeliveryDriverWorkStatuses { get; set; }
        public virtual DbSet<DeliveryViolationRecord> DeliveryViolationRecords { get; set; }
        public virtual DbSet<DeliveryViolationType> DeliveryViolationTypes { get; set; }
        public virtual DbSet<DriverCancellation> DriverCancellations { get; set; }
        public virtual DbSet<DriverCancellationRecord> DriverCancellationRecords { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<MemberViolationRecord> MemberViolationRecords { get; set; }
        public virtual DbSet<MemberViolationType> MemberViolationTypes { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderAssItem> OrderAssItems { get; set; }
        public virtual DbSet<OrderCustomizationItem> OrderCustomizationItems { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<OrderSchedule> OrderSchedules { get; set; }
        public virtual DbSet<OrderStatue> OrderStatues { get; set; }
        public virtual DbSet<Pay> Pays { get; set; }
        public virtual DbSet<ProcessingStatue> ProcessingStatues { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Qa> Qas { get; set; }
        public virtual DbSet<Qacategory> Qacategories { get; set; }
        public virtual DbSet<Staff> Staffs { get; set; }
        public virtual DbSet<Store> Stores { get; set; }
        public virtual DbSet<StoreBusinessHour> StoreBusinessHours { get; set; }
        public virtual DbSet<StoreCancellationRecord> StoreCancellationRecords { get; set; }
        public virtual DbSet<StoreCancellationType> StoreCancellationTypes { get; set; }
        public virtual DbSet<StoreCategory> StoreCategories { get; set; }
        public virtual DbSet<StorePrincipal> StorePrincipals { get; set; }
        public virtual DbSet<StoreViolationRecord> StoreViolationRecords { get; set; }
        public virtual DbSet<StoreViolationType> StoreViolationTypes { get; set; }
        public virtual DbSet<StoreWallet> StoreWallets { get; set; }
        public virtual DbSet<StoresCategoriesList> StoresCategoriesLists { get; set; }

//        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=FoodDelivery;Persist Security Info=True;User ID=FoodDiv;Password=123");
//            }
//        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AccountAddress>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("AccountAddress");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Member)
                    .WithMany()
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AccountAddress_Members");
            });

            modelBuilder.Entity<AccountStatue>(entity =>
            {
                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.HasIndex(e => e.MemberId, "IX_Carts")
                    .IsUnique();

                entity.HasOne(d => d.Member)
                    .WithOne(p => p.Cart)
                    .HasForeignKey<Cart>(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Carts_Members");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Carts_Products");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Carts_Stores");
            });

            modelBuilder.Entity<CartCustomizationItem>(entity =>
            {
                entity.HasOne(d => d.Cart)
                    .WithMany(p => p.CartCustomizationItems)
                    .HasForeignKey(d => d.CartId)
                    .HasConstraintName("FK_CartCustomizationItems_Carts");

                entity.HasOne(d => d.CustomizationItem)
                    .WithMany(p => p.CartCustomizationItems)
                    .HasForeignKey(d => d.CustomizationItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CartCustomizationItems_CustomizationItems");
            });

            modelBuilder.Entity<CommonReply>(entity =>
            {
                entity.HasNoKey();

                entity.Property(e => e.Answer)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.CreateTime).HasColumnType("datetime");
            });

            modelBuilder.Entity<CreditCard>(entity =>
            {
                entity.Property(e => e.BankName)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.CreditCard1)
                    .IsRequired()
                    .HasMaxLength(16)
                    .HasColumnName("CreditCard")
                    .IsFixedLength();

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.CreditCards)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CreditCard_Members");
            });

            modelBuilder.Entity<DeliveryDriver>(entity =>
            {
                entity.HasIndex(e => e.Phone, "IX_DeliveryDrivers")
                    .IsUnique();

                entity.HasIndex(e => e.Email, "IX_DeliveryDrivers_2")
                    .IsUnique();

                entity.HasIndex(e => e.Account, "IX_DeliveryDrivers_3")
                    .IsUnique();

                entity.Property(e => e.Account)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.AccountStatusId).HasDefaultValueSql("((1))");

                entity.Property(e => e.BankAccount)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Birthday).HasColumnType("date");

                entity.Property(e => e.DriverLicense)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.Idcard)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("IDCard");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.Latitude)
                    .HasMaxLength(50)
                    .HasColumnName("latitude");

                entity.Property(e => e.Longitude)
                    .HasMaxLength(50)
                    .HasColumnName("longitude");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsFixedLength();

                entity.Property(e => e.RegistrationTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.VehicleRegistration)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.WorkStatuseId).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.AccountStatus)
                    .WithMany(p => p.DeliveryDrivers)
                    .HasForeignKey(d => d.AccountStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DeliveryDrivers_DeliveryDriversAccountStatues");

                entity.HasOne(d => d.WorkStatuse)
                    .WithMany(p => p.DeliveryDrivers)
                    .HasForeignKey(d => d.WorkStatuseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DeliveryDrivers_DeliveryDriverWorkStatuses");
            });

            modelBuilder.Entity<DeliveryDriverWorkStatus>(entity =>
            {
                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<DeliveryViolationRecord>(entity =>
            {
                entity.Property(e => e.ViolationDate).HasColumnType("datetime");

                entity.HasOne(d => d.DeliveryDrivers)
                    .WithMany(p => p.DeliveryViolationRecords)
                    .HasForeignKey(d => d.DeliveryDriversId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DeliveryViolationRecords_DeliveryDrivers");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.DeliveryViolationRecords)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DeliveryViolationRecords_Orders");

                entity.HasOne(d => d.Violation)
                    .WithMany(p => p.DeliveryViolationRecords)
                    .HasForeignKey(d => d.ViolationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DeliveryViolationRecords_DeliveryViolationLists");
            });

            modelBuilder.Entity<DeliveryViolationType>(entity =>
            {
                entity.Property(e => e.Content).HasMaxLength(100);

                entity.Property(e => e.ViolationContent)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<DriverCancellation>(entity =>
            {
                entity.Property(e => e.Content).HasMaxLength(100);

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<DriverCancellationRecord>(entity =>
            {
                entity.Property(e => e.CancellationDate).HasColumnType("datetime");

                entity.HasOne(d => d.Cancellation)
                    .WithMany(p => p.DriverCancellationRecords)
                    .HasForeignKey(d => d.CancellationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CancellationRecords_Cancellations");

                entity.HasOne(d => d.DeliveryDrivers)
                    .WithMany(p => p.DriverCancellationRecords)
                    .HasForeignKey(d => d.DeliveryDriversId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CancellationRecords_DeliveryDrivers");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.DriverCancellationRecords)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CancellationRecords_Orders");
            });

            modelBuilder.Entity<Member>(entity =>
            {
                entity.HasIndex(e => e.Phone, "IX_Members")
                    .IsUnique();

                entity.HasIndex(e => e.Account, "IX_Members_2")
                    .IsUnique();

                entity.Property(e => e.Account)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.AccountStatusId).HasDefaultValueSql("((1))");

                entity.Property(e => e.Birthday).HasColumnType("date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsFixedLength();

                entity.Property(e => e.RegistrationTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.AccountStatus)
                    .WithMany(p => p.Members)
                    .HasForeignKey(d => d.AccountStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Members_MemberAccountStatues");
            });

            modelBuilder.Entity<MemberViolationRecord>(entity =>
            {
                entity.HasIndex(e => e.MemberId, "IX_MemberViolationRecord")
                    .IsUnique();

                entity.Property(e => e.ViolationDate).HasColumnType("datetime");

                entity.HasOne(d => d.Member)
                    .WithOne(p => p.MemberViolationRecord)
                    .HasForeignKey<MemberViolationRecord>(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Table_1_Members");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.MemberViolationRecords)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MemberViolationRecords_Orders");

                entity.HasOne(d => d.Violation)
                    .WithMany(p => p.MemberViolationRecords)
                    .HasForeignKey(d => d.ViolationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MemberViolationRecord_MemberViolationList");
            });

            modelBuilder.Entity<MemberViolationType>(entity =>
            {
                entity.Property(e => e.Content).HasMaxLength(100);

                entity.Property(e => e.ViolationContent)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.DeliveryAddress)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.DriverComment).HasMaxLength(100);

                entity.Property(e => e.Milage).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.StoreComment).HasMaxLength(100);

                entity.HasOne(d => d.DeliveryDrivers)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.DeliveryDriversId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Orders_DeliveryDrivers");

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.MemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Orders_Members");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Orders_Stores");
            });

            modelBuilder.Entity<OrderAssItem>(entity =>
            {
                entity.HasOne(d => d.CustomizationItem)
                    .WithMany(p => p.OrderAssItems)
                    .HasForeignKey(d => d.CustomizationItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderAssItems_CustomizationItems");

                entity.HasOne(d => d.OrderDetail)
                    .WithMany(p => p.OrderAssItems)
                    .HasForeignKey(d => d.OrderDetailId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderAssItems_OrderDetails");
            });

            modelBuilder.Entity<OrderCustomizationItem>(entity =>
            {
                entity.Property(e => e.ItemName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.Property(e => e.CustomizationList).HasMaxLength(200);

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderDetails_Orders");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderDetails_Products");
            });

            modelBuilder.Entity<OrderSchedule>(entity =>
            {
                entity.Property(e => e.MarkTime).HasColumnType("datetime");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderSchedules)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderStatuses_Orders");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.OrderSchedules)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderSchedules_OrderStatues");
            });

            modelBuilder.Entity<OrderStatue>(entity =>
            {
                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<Pay>(entity =>
            {
                entity.HasOne(d => d.DeliveryDrivers)
                    .WithMany(p => p.Pays)
                    .HasForeignKey(d => d.DeliveryDriversId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Pays_DeliveryDrivers");
            });

            modelBuilder.Entity<ProcessingStatue>(entity =>
            {
                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.ProductContent).HasMaxLength(100);

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductInformations_Stores");
            });

            modelBuilder.Entity<Qa>(entity =>
            {
                entity.ToTable("QA");

                entity.Property(e => e.Answer)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Qas)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_QA_QACategory");
            });

            modelBuilder.Entity<Qacategory>(entity =>
            {
                entity.ToTable("QACategory");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Staff>(entity =>
            {
                entity.HasIndex(e => e.Account, "IX_CustomerServices")
                    .IsUnique();

                entity.Property(e => e.Account)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Permissions).HasDefaultValueSql("((1))");

                entity.Property(e => e.RegistrationTime).HasColumnType("datetime");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Store>(entity =>
            {
                entity.HasIndex(e => e.StoreName, "IX_Store")
                    .IsUnique();

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.ContactNumber)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.StoreName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.StorePrincipal)
                    .WithMany(p => p.Stores)
                    .HasForeignKey(d => d.StorePrincipalId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Store_StorePrincipal");

                entity.HasMany(d => d.Members)
                    .WithMany(p => p.Stores)
                    .UsingEntity<Dictionary<string, object>>(
                        "Favourite",
                        l => l.HasOne<Member>().WithMany().HasForeignKey("MemberId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Favourites_Members"),
                        r => r.HasOne<Store>().WithMany().HasForeignKey("StoreId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Favourites_Stores"),
                        j =>
                        {
                            j.HasKey("StoreId", "MemberId");

                            j.ToTable("Favourites");
                        });
            });

            modelBuilder.Entity<StoreBusinessHour>(entity =>
            {
                entity.ToTable("StoreBusinessHour");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.StoreBusinessHours)
                    .HasForeignKey(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreBusinessHour_Stores");
            });

            modelBuilder.Entity<StoreCancellationRecord>(entity =>
            {
                entity.Property(e => e.CancellationDate).HasColumnType("datetime");

                entity.HasOne(d => d.Cancellation)
                    .WithMany(p => p.StoreCancellationRecords)
                    .HasForeignKey(d => d.CancellationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreCancellationRecords_StoreCancellations");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.StoreCancellationRecords)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreCancellationRecords_Orders");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.StoreCancellationRecords)
                    .HasForeignKey(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreCancellationRecords_Stores");
            });

            modelBuilder.Entity<StoreCancellationType>(entity =>
            {
                entity.Property(e => e.Content).HasMaxLength(100);

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<StoreCategory>(entity =>
            {
                entity.HasIndex(e => e.CategoryName, "IX_StoreCategories")
                    .IsUnique();

                entity.Property(e => e.CategoryContent)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.CategoryName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<StorePrincipal>(entity =>
            {
                entity.HasIndex(e => e.Email, "IX_ShopPrincipal_1")
                    .IsUnique();

                entity.HasIndex(e => e.Account, "IX_ShopPrincipal_2")
                    .IsUnique();

                entity.Property(e => e.Account)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.AccountStatusId).HasDefaultValueSql("((1))");

                entity.Property(e => e.Birthday).HasColumnType("date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsFixedLength();

                entity.Property(e => e.RegistrationTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.AccountStatus)
                    .WithMany(p => p.StorePrincipals)
                    .HasForeignKey(d => d.AccountStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StorePrincipals_StoreAccountStatues");
            });

            modelBuilder.Entity<StoreViolationRecord>(entity =>
            {
                entity.HasIndex(e => e.StoreId, "IX_StoreViolationRecord")
                    .IsUnique();

                entity.Property(e => e.ViolationDate).HasColumnType("datetime");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.StoreViolationRecords)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreViolationRecords_Orders");

                entity.HasOne(d => d.Store)
                    .WithOne(p => p.StoreViolationRecord)
                    .HasForeignKey<StoreViolationRecord>(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreViolationRecord_Store");

                entity.HasOne(d => d.Violation)
                    .WithMany(p => p.StoreViolationRecords)
                    .HasForeignKey(d => d.ViolationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreViolationRecord_StoreViolationList");
            });

            modelBuilder.Entity<StoreViolationType>(entity =>
            {
                entity.Property(e => e.Content).HasMaxLength(100);

                entity.Property(e => e.ViolationContent)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<StoreWallet>(entity =>
            {
                entity.ToTable("StoreWallet");

                entity.HasIndex(e => e.StoreId, "IX_StoreWallet")
                    .IsUnique();

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.StoreWallets)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreWallet_Orders");

                entity.HasOne(d => d.Store)
                    .WithOne(p => p.StoreWallet)
                    .HasForeignKey<StoreWallet>(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoreWallet_Stores");
            });

            modelBuilder.Entity<StoresCategoriesList>(entity =>
            {
                entity.HasOne(d => d.Category)
                    .WithMany(p => p.StoresCategoriesLists)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoresCategoriesList_StoreCategories");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.StoresCategoriesLists)
                    .HasForeignKey(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StoresCategoriesList_Stores");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}