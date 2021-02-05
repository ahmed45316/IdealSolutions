using System;
using AutoMapper;
using BackendCore.Common.Abstraction.UnitOfWork;
using BackendCore.Common.Events;
using Tasks.Entities;

namespace Tasks.Service.Services.Events
{
    public class EmployeeChange : IEmployeeChange
    {
        private readonly IUnitOfWork<Entities.Employee> _unitOfWork;
        private readonly IMapper _mapper;
        public EmployeeChange(IUnitOfWork<Entities.Employee> unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public void EmployeeChangeSubsribe()
        {
            EventPass<EmployeeChanged>.Subscribe(QueuesNames.Employees, OnEmployeeChanged);
        }
        private void OnEmployeeChanged(EmployeeChanged input)
        {
            try
            {
                var employee = _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == input.Id)?.Result;
                if (employee == null)
                {
                    _unitOfWork.Repository.Add(_mapper.Map<Employee>(input));
                }
                else
                {
                    var entity = _mapper.Map(input, employee);
                    _unitOfWork.Repository.Update(entity, entity.Id);
                }

                _unitOfWork.SaveChanges().Wait();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

        }
    }
}
