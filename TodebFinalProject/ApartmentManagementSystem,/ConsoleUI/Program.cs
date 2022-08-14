using DataAccess.Concrete.EntityFramework;
using DataAccess.Concrete.EntityFramework.Contexts;
using Entities.Concrete;
using System;

namespace ConsoleUI
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Landlord landLord = new Landlord
            {
                FirstName = "Musa",
                LastName = "Uyumaz",
                NationalIdentityNumber = "12345678910",
                Email = "musa.uyumaz73@gmail.com",
                HaveAVehicle = false,
                LicensePlate = ""
            };
            Lessee lessee = new Lessee
            {
                FirstName = "Musa",
                LastName = "Uyumaz",
                NationalIdentityNumber = "12345678910",
                Email = "musa.uyumaz73@gmail.com",
                HaveAVehicle = false,
                LicensePlate ="",
                ContractTerm = "4"
            };

            EfLandlordDal landlordDal = new EfLandlordDal(new HousingEstateContext());
            EfLesseeDal efLesseeDal = new EfLesseeDal(new HousingEstateContext());
            efLesseeDal.Insert(lessee);
            landlordDal.Insert(landLord);

            foreach (var item in landlordDal.GetAll())
            {
                Console.WriteLine(item.FirstName);
            }
            EfApartmentDal efApartmentDal = new EfApartmentDal(new HousingEstateContext());

            //foreach (var item in efApartmentDal.GetAll2())
            //{
            //    Console.WriteLine(item.ApartmentNumber);
            //}
        }
    }
}
