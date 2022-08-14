using Core.Entities.Abstract;
using DTOs.Concrete.ElectricBillDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EntityFramework.Contexts
{
    public class HousingEstateContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder.UseSqlServer("Data source=DESKTOP-M10C79F;Initial Catalog = HousingEstate;Integrated Security = True;"));
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Lessee>().ToTable("Lessees");
            modelBuilder.Entity<Landlord>().ToTable("Landlords");
            modelBuilder.Entity<ElectricBill>().ToTable("ElectricBills");
            modelBuilder.Entity<WaterBill>().ToTable("WaterBills");
            modelBuilder.Entity<GasBill>().ToTable("GasBills");
            modelBuilder.Entity<ApartmentDetail>().ToTable("ApartmentDetails");
            modelBuilder.Entity<ApartmentDetailView>().ToTable("ApartmentDetailViews");

        }
        //One To One
        #region Tables
        public DbSet<User> Users { get; set; }
        public DbSet<Lessee> Lessees { get; set; }
        public DbSet<Landlord> LandLords { get; set; }
        public DbSet<Bill> Bills { get; set; }
        public DbSet<ElectricBill> ElectricBills { get; set; }
        public DbSet<WaterBill> WaterBills { get; set; }
        public DbSet<GasBill> GasBills { get; set; }
        public DbSet<Apartment> Apartments { get; set; }
        public DbSet<ApartmentDetail> ApartmentDetails { get; set; }
        public DbSet<Message> Messages { get; set; }

        public DbSet<Block> Blocks { get; set; }
        public DbSet<Dues> Dues { get; set; }
        public DbSet<Phone> Phones { get; set; }
        public DbSet<HouseHoldType> HouseHoldTypes { get; set; }
        #endregion

        #region Views
        public DbSet<HouseElectricBillView> HouseElectricBillViews { get; set; }
        public DbSet<HouseGasBillView> HouseGasBillViews { get; set; }
        public DbSet<HouseWaterBillView> HouseWaterBillViews { get; set; }
        public DbSet<ApartmentView> ApartmentViews { get; set; }
        public DbSet<ApartmentDetailView> ApartmentDetailViews { get; set; }
        public DbSet<UserInformationView> UserInformationViews { get; set; }
        public DbSet<MessageInformationView> MessageInformationViews { get; set; }


        #endregion


    }
}
