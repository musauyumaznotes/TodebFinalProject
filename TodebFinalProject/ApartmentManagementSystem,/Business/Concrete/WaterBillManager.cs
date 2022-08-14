using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.ElectricBillDto.Queries;
using DTOs.Concrete.WaterBillDto.Commands;
using DTOs.Concrete.WaterBillDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class WaterBillManager : IWaterBillService
    {
        private readonly IWaterBillDal _waterBillDall;
        private readonly IMapper _mapper;
        public WaterBillManager(IWaterBillDal waterBillDall, IMapper mapper)
        {
            _waterBillDall = waterBillDall;
            _mapper = mapper;
        }

        public IResult Add(CommandWaterBillDto commandDto)
        {
            var addedEntity = _mapper.Map<WaterBill>(commandDto);
            _waterBillDall.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryWaterBillDto queryDto)
        {
            var deletedEntity = _mapper.Map<WaterBill>(queryDto);
            _waterBillDall.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted); 
        }

        public IDataResult<IList<CommandWaterBillDto>> GetAll()
        {
            var data = _waterBillDall.GetAll();
            var mappedData = data.Select(x=> _mapper.Map<CommandWaterBillDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandWaterBillDto>>(mappedData,Messages.Listed);

        }

        public IDataResult<QueryWaterBillDto> GetById(int id)
        {
            var data = _waterBillDall.Get(x => x.Id == id);
            var mappedEntity = _mapper.Map<QueryWaterBillDto>(data);
            return new SuccessDataResult<QueryWaterBillDto>(mappedEntity,Messages.Brought);
        }

        public IDataResult<IList<HouseWaterBillView>> GetPaidInWaterBills()
        {
            var data = _waterBillDall.GetPaidInWaterBills();
            return new SuccessDataResult<IList<HouseWaterBillView>>(data, Messages.Listed);
        }

        public IDataResult<IList<HouseWaterBillView>> GetUnpaidWaterBills()
        {
            var data = _waterBillDall.GetUnpaidWaterBills();
            return new SuccessDataResult<IList<HouseWaterBillView>>(data, Messages.Listed);
        }

        public IDataResult<IList<HouseWaterBillView>> GetWaterBillsByHomeId(int homeId)
        {
            var data = _waterBillDall.GetWaterBillsByHomeId(homeId).ToList();
            return new SuccessDataResult<IList<HouseWaterBillView>>(data, Messages.Listed);
        }

        public IResult Update(QueryWaterBillDto queryDto)
        {
            var updatedEntity = _mapper.Map<WaterBill>(queryDto);
            _waterBillDall.Update(updatedEntity);
            return new SuccessResult(Messages.Updated); 
        }
    }
}
