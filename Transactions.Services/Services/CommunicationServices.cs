using System;
using System.Collections.Generic;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Tenets.Common.Core;
using Transactions.Entities.Entities;
using Transactions.Services.Core;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;
using Transactions.Services.UnitOfWork;

namespace Transactions.Services.Services
{
    public class CommunicationServices : ICommunicationServices
    {
        private readonly IUnitOfWork<Customer> _unitOfWork;
        private readonly IMapper _mapper;

        public CommunicationServices(IUnitOfWork<Customer> unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        public void AddAsync(CustomerDto model)
        {
            var entity = _mapper.Map<Customer>(model);
            _unitOfWork.Repository.Add(entity);
            var i =_unitOfWork.SaveChanges().Result;
        }

        public void UpdateAsync(CustomerDto model)
        {
            var entityToUpdate = _unitOfWork.Repository.GetAsync(model.Id).Result;
            var newEntity = _mapper.Map(model, entityToUpdate);
            _unitOfWork.Repository.Update(entityToUpdate, newEntity);
            var i =_unitOfWork.SaveChanges().Result;
        }

        public void DeleteAsync(Guid id)
        {
            var entityToDelete = _unitOfWork.Repository.GetAsync(id).Result;
            _unitOfWork.Repository.Remove(entityToDelete);
           var i = _unitOfWork.SaveChanges().Result;
        }
    }
}
