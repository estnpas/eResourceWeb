using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eResourceWeb.Models
{
    [Table("ResourceMaster")]
    public class ResourceMaster : BaseModel
    {
        [Key]
        public Double ResourceId { get; set; }
        public string ResourceName { get; set; }
        public Double TypeId { get; set; }
        public Double ManagerId { get; set; }
        public Double Status { get; set; }
        public Double DesignationId { get; set; }
        public Double RegionId { get; set; }
        public Double OfficeId { get; set; }
        public Double DepartmentId { get; set; }
        public Double TeamId { get; set; }
        public string Email { get; set; }
        public string Notes { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? TerminationDate { get; set; }
        public string Phone { get; set; }
        public Double TimeSheetApproval { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdateDate { get; set; }
       
    }
}
