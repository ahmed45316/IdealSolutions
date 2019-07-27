using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Tenets.Common.Core;

namespace Codes.Entities.Entities.Base
{
    public class BaseEntity: ICommonProperty
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(Order = 0)]
        public Guid Id { get; set; }
        public Guid CreateUserId { get; set; }
        public DateTime CreateDate { get; set; }
        public Guid? ModifyUserId { get; set; }
        public DateTime? ModifyDate { get; set; }
    }
}
