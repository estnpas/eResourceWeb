using eResourceWeb.DTO;
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
        public int ResourceId { get; set; }
        public string ResourceName { get; set; }
        public int TypeId { get; set; }
        public int ManagerId { get; set; }
        public int Status { get; set; }
        public int DesignationId { get; set; }
        public int RegionId { get; set; }
        public int OfficeId { get; set; }
        public int DepartmentId { get; set; }
        public int TeamId { get; set; }
        public string Email { get; set; }
        public string Notes { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? TerminationDate { get; set; }
        public string Phone { get; set; }
        public int TimeSheetApproval { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdateDate { get; set; }

        public List<ResourceSkillDTO> skillsList;
        public string ManagerName;
       
    }
}
