using AutoMapper;
using Business.Abstract;
using Business.Constants;
using Core.DTOs.Abstract;
using Core.Utilities.Results.Abstract;
using Core.Utilities.Results.Concrete;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using DTOs.Concrete.ApartmentDto.Commands;
using DTOs.Concrete.MessageDto.Commands;
using DTOs.Concrete.MessageDto.Queries;
using Entities.Concrete;
using Entities.Concrete.SqlViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class MessageManager : IMessageService
    {
        private readonly IMessageDal _messageDal;
        private readonly IMapper _mapper;
        public MessageManager(IMessageDal messageDal, IMapper mapper)
        {
            _messageDal = messageDal;
            _mapper = mapper;
        }

        public IResult Add(CommandMessageDto commandDto)
        {
            var addedEntity = _mapper.Map<Message>(commandDto);
            _messageDal.Insert(addedEntity);
            return new SuccessResult(Messages.Added);
        }

        public IResult Delete(QueryMessageDto queryDto)
        {
            var deletedEntity = _mapper.Map<Message>(queryDto);
            _messageDal.Delete(deletedEntity);
            return new SuccessResult(Messages.Deleted);
        }

        public IDataResult<IList<CommandMessageDto>> GetAll()
        {
            var data = _messageDal.GetAll();
            var mappedData = data.Select(x => _mapper.Map<CommandMessageDto>(x)).ToList();
            return new SuccessDataResult<IList<CommandMessageDto>>(mappedData, Messages.Listed);
        }

        public IDataResult<IList<MessageInformationView>> GetAllMessageInformations()
        {
            var data = _messageDal.GetAllMessageInformations();
            return new SuccessDataResult<IList<MessageInformationView>>(data,Messages.Listed);
        }

        public IDataResult<QueryMessageDto> GetById(int id)
        {
            var data = _messageDal.Get(x => x.Id == id);
            var mappedData = _mapper.Map<QueryMessageDto>(data);
            return new SuccessDataResult<QueryMessageDto>(mappedData,Messages.Brought);
        }

        public IResult Update(QueryMessageDto queryDto)
        {
            var updatedEntity = _mapper.Map<Message>(queryDto);
            _messageDal.Update(updatedEntity);
            return new SuccessResult(Messages.Updated);
        }
    }
}
