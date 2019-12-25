using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Transactions.Services.Dto;

namespace Transactions.Services.Interfaces
{
    public interface ICommunicationServices
    {
        void AddAsync(CustomerDto model);
        void UpdateAsync(CustomerDto model);
        void DeleteAsync(Guid id);
    }
}
