using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Net;
using System.Threading.Tasks;
using BackendCore.Common.Core;
using BackendCore.Common.DTO.Employee;
using BackendCore.Common.Events;
using BackendCore.Common.Extensions;
using BackendCore.Common.FilterDto;
using Employee.Service.Services.Base;
using LinqKit;

// ReSharper disable ArrangeModifiersOrder

namespace Employee.Service.Services.Employee
{
    public class EmployeeService : BaseService<Entities.Employee, EmployeeDto>, IEmployeeService
    {
        public EmployeeService(IServiceBaseParameter<Entities.Employee> parameters) : base(parameters)
        {
        }

        public async override Task<IResult> AddAsync(EmployeeDto model)
        {
            var emailExist = await UnitOfWork.Repository.Any(q => q.Email == model.Email);
            if (emailExist)
            {
                return new ResponseResult(result: false, status: HttpStatusCode.Conflict,
                    message: "Email already exist");
            }
            var entity = Mapper.Map<EmployeeDto, Entities.Employee>(model);
            var data = UnitOfWork.Repository.Add(entity);
            var affectedRows = await UnitOfWork.SaveChanges();
            if (affectedRows > 0)
            {
                Result = new ResponseResult(result: null, status: HttpStatusCode.Created,
                    message: "Data Inserted Successfully");
            }

            Result.Data = model;
            EventPass<EmployeeChanged>.Publish(new EmployeeChanged { Id = data.Id, EmployeeFullName = $"{model.FirstName} {model.LastName}" }, QueuesNames.Employees);
            return Result;
        }

        public async override Task<IResult> UpdateAsync(EmployeeDto model)
        {
            var entityToUpdate = await UnitOfWork.Repository.GetAsync(model.Id);
            var fullName = $"{entityToUpdate.FirstName} {entityToUpdate.LastName}";
            var emailExist = await UnitOfWork.Repository.Any(q => q.Email == model.Email && q.Id != entityToUpdate.Id);
            if (emailExist)
            {
                return new ResponseResult(result: false, status: HttpStatusCode.Conflict,
                    message: "Email already exist");
            }
            var newEntity = Mapper.Map(model, entityToUpdate);
            UnitOfWork.Repository.Update(entityToUpdate, newEntity);
            var affectedRows = await UnitOfWork.SaveChanges();
            if (affectedRows > 0)
            {
                Result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted,
                    message: "Data Updated Successfully");
            }
            
            var newFullName = $"{model.FirstName} {model.LastName}";
            if (fullName != newFullName)
            {
                EventPass<EmployeeChanged>.Publish(new EmployeeChanged { Id = entityToUpdate.Id, EmployeeFullName = newFullName }, QueuesNames.Employees);
            }
            return Result;
        }

        public async Task<IResult> GetAllWithFilterAsync(EmployeeFilterDto filter)
        {

            var sortCriteria = new List<SortModel>();
            var sort = new SortModel();
            sortCriteria.Add(sort);
            var query = await UnitOfWork.Repository.FindAsync(PredicateBuilderFunction(filter), sortCriteria);
            var data = Mapper.Map<IEnumerable<EmployeeDto>>(query);
            return ResponseResult.PostResult(data, status: HttpStatusCode.OK,
                message: HttpStatusCode.OK.ToString());
        }
        static Expression<Func<Entities.Employee, bool>> PredicateBuilderFunction(EmployeeFilterDto filter)
        {
            var predicate = PredicateBuilder.New<Entities.Employee>(true);
            if (!string.IsNullOrWhiteSpace(filter.JobTitle))
            {
                predicate = predicate.And(b => b.JobTitle.ToLower().Contains(filter.JobTitle.ToLower()));
            }
            if (filter.Salary != null)
            {
                predicate = predicate.And(b => b.Salary == filter.Salary);
            }
            return predicate;
        }
    }
}
