using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.PhoneDto.Commands;
using DTOs.Concrete.PhoneDto.Queries;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class PhoneManager : IPhoneService
    {
        private readonly IPhoneDal _phoneDal;
        private readonly IMapper _mapper;
        public PhoneManager(IPhoneDal phoneDal, IMapper mapper)
        {
            _phoneDal = phoneDal;
            _mapper = mapper;
        }

        public IResult Add(CommandPhoneDto commandDto)
        {
            var addedEntity = _mapper.Map<Phone>(commandDto);
            _phoneDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryPhoneDto queryDto)
        {
            var deletedEntity = _mapper.Map<Phone>(queryDto);
            _phoneDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandPhoneDto>> GetAll()
        {
            var data =_phoneDal.GetAll();
            var mappedEntity = data.Select(x => _mapper.Map<CommandPhoneDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandPhoneDto>>(mappedEntity,Messages.Listed);
        }

        public IDataResult<QueryPhoneDto> GetById(int id)
        {
            var data = _phoneDal.Get(x => x.Id == id);
            var mappedEntity = _mapper.Map<QueryPhoneDto>(data);
            return new SuccessDataResult<QueryPhoneDto>(mappedEntity,Messages.Brought);
        }

        public IResult Update(QueryPhoneDto queryDto)
        {
            var updatedEntity = _mapper.Map<Phone>(queryDto);
            _phoneDal.Update(updatedEntity);
            return new SuccessResult(Messages.Updated);
        }
    }
}
