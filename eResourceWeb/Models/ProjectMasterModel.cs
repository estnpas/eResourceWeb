using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eResourceWeb.Models
{
    [Table("ProjectMaster")]
    public class ProjectMasterModel : BaseModel
    {
        [Key]
        public int ProjectId { get; set; }
        public string ColorCode {get; set; }
        public string Title {get; set; }
        public string ProjectCode {get; set; }
        public bool Status {get; set;}
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int ManagerId { get; set; }
        public bool Confirmed { get; set; }
        public bool Billable { get; set; }
        public int RegionId { get; set; }
        public int OfficeId { get; set; } 
        public int DepartmentId { get; set; } 
        public int TeamId { get; set; }
        public double BillingRate { get; set; } 
        public string Notes {get; set; }
        public string UpdateBy {get; set; }
        public DateTime UpdateDate { get; set; }
        public int leave { get; set; }
 
    }
}