using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.ElectricBillDto.Commands;
using DTOs.Concrete.ElectricBillDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class ElectricBillManager : IElectricBillService
    {
        private readonly IElectricBillDal _electricBillDal;
        private readonly IMapper _mapper;

        public ElectricBillManager(IElectricBillDal electricBillDal, IMapper mapper)
        {
            _electricBillDal = electricBillDal;
            _mapper = mapper;
        }

        public IResult Add(CommandElectricBillDto commandDto)
        {
            var addedEntity = _mapper.Map<ElectricBill>(commandDto);
            _electricBillDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryElectricBillDto queryDto)
        {
            var deletedEntity = _mapper.Map<ElectricBill>(queryDto);
            _electricBillDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandElectricBillDto>> GetAll()
        {
            var data = _electricBillDal.GetAll();
            var mappedEntity = data.Select(x=>_mapper.Map<CommandElectricBillDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandElectricBillDto>>(mappedEntity,Messages.Listed);
        }

        public IDataResult<QueryElectricBillDto> GetById(int id)
        {
            var data = _electricBillDal.Get(x=>x.Id == id);
            var mappedEntity = _mapper.Map<QueryElectricBillDto>(data);
            return new SuccessDataResult<QueryElectricBillDto>(mappedEntity, Messages.Brought);
        }

        public IDataResult<IList<HouseElectricBillView>> GetElectricBillsByHomeId(int homeId)
        {
            var data = _electricBillDal.GetElectricBillsByHomeId(homeId).ToList();
            return new SuccessDataResult<IList<HouseElectricBillView>>(data,Messages.Listed);
        }

        public IDataResult<IList<HouseElectricBillView>> GetPaidInElectricBills()
        {
            var data = _electricBillDal.GetPaidInElectricBills();
            return new SuccessDataResult<IList<HouseElectricBillView>>(data,Messages.Listed);
        }

        public IDataResult<IList<HouseElectricBillView>> GetUnpaidElectricBills()
        {
            var data = _electricBillDal.GetUnpaidElectricBills();
            return new SuccessDataResult<IList<HouseElectricBillView>>(data, Messages.Listed);
        }

        public IResult Update(QueryElectricBillDto queryDto)
        {
            var updatedEntity = _mapper.Map<ElectricBill>(queryDto);
            _electricBillDal.Update(updatedEntity);
            return new SuccessResult(Messages.Updated);
        }
    }
}
