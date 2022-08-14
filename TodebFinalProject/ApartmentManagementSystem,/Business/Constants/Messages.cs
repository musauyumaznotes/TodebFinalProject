using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Constants
{
    public class Messages
    {
        public static string Added = " Eklendi";
        public static string Listed = "Veri Listelendi";
        public static string Deleted = " Silindi";
        public static string Updated = " Güncellendi";
        public static string Brought = " Getirildi";
        public static string NameInvalid = " İsmi geçersiz";
        public static string MaintenanceTime = " Sistem bakımda";
        public static string NameAlreadyExists = " Bu isimde zaten Birşey var";
        public static string AuthorizationDenied = " Yetkiniz yok.";
        public static string ListedDetails = "Detaylar Listelendi";

        #region BusinessRules
        #region Apartment
        public static string SameNumberAlreadyExistsInBlock = "Bu blokta bu Daire Numarası zaten kayıtlı";
        #endregion
        #endregion


    }
}
