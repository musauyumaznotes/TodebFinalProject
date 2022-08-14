using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DTOs.Concrete.LesseeDto.Commands;
using DTOs.Concrete.LesseeDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class LesseeManager : ILesseeService
    {
        private readonly ILesseeDal _lesseeDal;
        private readonly IMapper _mapper;
        public LesseeManager(ILesseeDal lesseeDal, IMapper mapper)
        {
            _lesseeDal = lesseeDal;
            _mapper = mapper;
        }

        public IResult Add(CommandLesseeDto commandDto)
        {
            var addedEntity = _mapper.Map<Lessee>(commandDto);
            _lesseeDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryLesseeDto queryDto)
        {
            var deletedEntity = _mapper.Map<Lessee>(queryDto);
            _lesseeDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandLesseeDto>> GetAll()
        {
            var data = _lesseeDal.GetAll();
            var mappedEntity = data.Select(x => _mapper.Map<CommandLesseeDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandLesseeDto>>(mappedEntity,Messages.Listed);
        }

        public IDataResult<QueryLesseeDto> GetById(int id)
        {
            var data = _lesseeDal.Get(x=>x.Id == id);
            var mappedEntity = _mapper.Map<QueryLesseeDto>(data);
            return new SuccessDataResult<QueryLesseeDto>(mappedEntity, Messages.Brought);
        }

        public IDataResult<IList<UserInformationView>> GetLesseeInformation()
        {
            var data = _lesseeDal.GetLesseeInformation();
            return new SuccessDataResult<IList<UserInformationView>>(data,Messages.Listed);
        }

        public IResult Update(QueryLesseeDto queryDto)
        {
            var updateEntity = _mapper.Map<Lessee>(queryDto);
            _lesseeDal.Update(updateEntity);
            return new SuccessResult(Messages.Updated);
        }
    }
}
