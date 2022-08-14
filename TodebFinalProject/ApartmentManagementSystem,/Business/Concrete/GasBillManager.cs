using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.GasBillDto.Commands;
using DTOs.Concrete.GasBillDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class GasBillManager : IGasBillService
    {
        private readonly IGasBillDal _gasBillDal;
        private readonly IMapper _mapper;
        public GasBillManager(IGasBillDal gasBillDal, IMapper mapper)
        {
            _gasBillDal = gasBillDal;
            _mapper = mapper;
        }
        public IResult Add(CommandGasBillDto commandDto)
        {
            var addedEntity = _mapper.Map<GasBill>(commandDto);
            _gasBillDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryGasBillDto queryDto)
        {
            var deletedEntity = _mapper.Map<GasBill>(queryDto);
            _gasBillDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandGasBillDto>> GetAll()
        {
            var data = _gasBillDal.GetAll();
            var mappedData = data.Select(x=>_mapper.Map<CommandGasBillDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandGasBillDto>>(mappedData, Messages.Listed);
        }

        public IDataResult<QueryGasBillDto> GetById(int id)
        {
            var data = _gasBillDal.Get(x=>x.Id == id);
            var mappedData = _mapper.Map<QueryGasBillDto>(data);
            return new SuccessDataResult<QueryGasBillDto>(mappedData, Messages.Brought);
        }

        public IDataResult<IList<HouseGasBillView>> GetGasBillsByHomeId(int homeId)
        {
            var data = _gasBillDal.GetGasBillsByHomeId(homeId);
            return new SuccessDataResult<IList<HouseGasBillView>>(data,Messages.Listed);
        }

        public IDataResult<IList<HouseGasBillView>> GetPaidInGasBills()
        {
            var data = _gasBillDal.GetPaidInGasBills();
            return new SuccessDataResult<IList<HouseGasBillView>>(data,Messages.Listed);
        }

        public IDataResult<IList<HouseGasBillView>> GetUnpaidGasBills()
        {
            var data = _gasBillDal.GetUnpaidGasBills();
            return new SuccessDataResult<IList<HouseGasBillView>>(data, Messages.Listed);
        }

        public IResult Update(QueryGasBillDto queryDto)
        {
            var updatedEntity = _mapper.Map<GasBill>(queryDto);
            _gasBillDal.Update(updatedEntity);
            return new SuccessResult(Messages.Updated);
        }
    }
}
