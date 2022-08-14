using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.HouseHoldTypeDto.Commands;
using DTOs.Concrete.HouseHoldTypeDto.Queries;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class HouseHoldTypeManager : IHouseHoldTypeService
    {
        private readonly IHouseHoldTypeDal _houseHoldTypeDal;
        private readonly IMapper _mapper;
        public HouseHoldTypeManager(IHouseHoldTypeDal houseHoldTypeDal, IMapper mapper)
        {
            _houseHoldTypeDal = houseHoldTypeDal;
            _mapper = mapper;
        }

        public IResult Add(CommandHouseHoldTypeDto commandDto)
        {
            var addedEntity = _mapper.Map<HouseHoldType>(commandDto);
            _houseHoldTypeDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryHouseHoldTypeDto queryDto)
        {
            var deletedEntity = _mapper.Map<HouseHoldType>(queryDto);
            _houseHoldTypeDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandHouseHoldTypeDto>> GetAll()
        {
            var data = _houseHoldTypeDal.GetAll();
            var mappedEntity = data.Select(x => _mapper.Map<CommandHouseHoldTypeDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandHouseHoldTypeDto>>(mappedEntity, Messages.Listed);
        }

        public IDataResult<QueryHouseHoldTypeDto> GetById(int id)
        {
            var data = _houseHoldTypeDal.Get(x=>x.Id == id);
            var mappedEntity = _mapper.Map<QueryHouseHoldTypeDto>(data);
            return new SuccessDataResult<QueryHouseHoldTypeDto>(mappedEntity, Messages.Brought);
        }

        public IResult Update(QueryHouseHoldTypeDto queryDto)
        {
            var updatedEntity = _mapper.Map<HouseHoldType>(queryDto);
            _houseHoldTypeDal.Update(updatedEntity);
            return new SuccessResult(Messages.Updated);
        }
    }
}
