using AutoMapper;
using DTOs.Concrete.ApartmentDetailDto.Commands;
using DTOs.Concrete.ApartmentDetailDto.Queries;
using DTOs.Concrete.ApartmentDto.Commands;
using DTOs.Concrete.ApartmentDto.Queries;
using DTOs.Concrete.BlockDto.Commands;
using DTOs.Concrete.BlockDto.Queries;
using DTOs.Concrete.DuesDto.Commands;
using DTOs.Concrete.DuesDto.Queries;
using DTOs.Concrete.ElectricBillDto.Commands;
using DTOs.Concrete.ElectricBillDto.Queries;
using DTOs.Concrete.GasBillDto.Commands;
using DTOs.Concrete.GasBillDto.Queries;
using DTOs.Concrete.HouseHoldTypeDto.Commands;
using DTOs.Concrete.HouseHoldTypeDto.Queries;
using DTOs.Concrete.LandlordDto.Commands;
using DTOs.Concrete.LandlordDto.Queries;
using DTOs.Concrete.LesseeDto.Commands;
using DTOs.Concrete.LesseeDto.Queries;
using DTOs.Concrete.MessageDto.Commands;
using DTOs.Concrete.MessageDto.Queries;
using DTOs.Concrete.PhoneDto.Commands;
using DTOs.Concrete.PhoneDto.Queries;
using DTOs.Concrete.WaterBillDto.Commands;
using DTOs.Concrete.WaterBillDto.Queries;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Configuration.Mapper
{
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            #region Apartment Maps
            CreateMap<CommandApartmentDto, Apartment>();
            CreateMap<QueryApartmentDto, Apartment>();
            CreateMap<Apartment, CommandApartmentDto>();
            CreateMap<Apartment, QueryApartmentDto>();
            #endregion
            #region  ApartmentDetail Maps

            CreateMap<CommandApartmentDetailDto, ApartmentDetail>();
            CreateMap<QueryApartmentDetailDto, ApartmentDetail>();
            CreateMap<ApartmentDetail, CommandApartmentDetailDto>();
            CreateMap<ApartmentDetail, QueryApartmentDetailDto>();

            #endregion
            #region  Block Maps
            CreateMap<CommandBlockDto, Block>();
            CreateMap<QueryBlockDto, Block>();
            CreateMap<Block, CommandBlockDto>();
            CreateMap<Block, QueryBlockDto>();

            #endregion
            #region Dues Maps
            CreateMap<CommandDuesDto, Dues>();
            CreateMap<QueryDuesDto, Dues>();
            CreateMap<Dues, CommandDuesDto>();
            CreateMap<Dues, QueryDuesDto>();

            #endregion
            #region ElectricBill Maps

            CreateMap<CommandElectricBillDto, ElectricBill>();
            CreateMap<QueryElectricBillDto, ElectricBill>();
            CreateMap<ElectricBill, CommandElectricBillDto>();
            CreateMap<ElectricBill, QueryElectricBillDto>();

            #endregion
            #region GasBill Maps
            CreateMap<CommandGasBillDto, GasBill>();
            CreateMap<QueryGasBillDto, GasBill>();
            CreateMap<GasBill, CommandGasBillDto>();
            CreateMap<GasBill, QueryGasBillDto>();

            #endregion
            #region HouseHoldType Maps
            CreateMap<CommandHouseHoldTypeDto, HouseHoldType>();
            CreateMap<QueryHouseHoldTypeDto, HouseHoldType>();
            CreateMap<HouseHoldType, CommandHouseHoldTypeDto>();
            CreateMap<HouseHoldType, QueryHouseHoldTypeDto>();

            #endregion
            #region   Landlord Maps
            CreateMap<CommandLandlordDto, Landlord>();
            CreateMap<QueryLandlordDto, Landlord>();
            CreateMap<Landlord, CommandLandlordDto>();
            CreateMap<Landlord, QueryLandlordDto>();

            #endregion
            #region Lessee Maps
            CreateMap<CommandLesseeDto, Lessee>();
            CreateMap<QueryLesseeDto, Lessee>();
            CreateMap<Lessee, CommandLesseeDto>();
            CreateMap<Lessee, QueryLesseeDto>();

            #endregion
            #region Phone Maps
            CreateMap<CommandPhoneDto, Phone>();
            CreateMap<QueryPhoneDto, Phone>();
            CreateMap<Phone, CommandPhoneDto>();
            CreateMap<Phone, QueryPhoneDto>();


            #endregion
            #region  WaterBill Maps
            CreateMap<CommandWaterBillDto, WaterBill>();
            CreateMap<QueryWaterBillDto, WaterBill>();
            CreateMap<WaterBill, CommandWaterBillDto>();
            CreateMap<WaterBill, QueryWaterBillDto>();

            #endregion
            #region Message Maps
            CreateMap<CommandMessageDto, Message>();
            CreateMap<QueryMessageDto, Message>();
            CreateMap<Message, CommandMessageDto>();
            CreateMap<Message, QueryMessageDto>();

            #endregion










        }
    }
}
