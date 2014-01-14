using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eResourceWeb.Models
{
    [Table("Booking")]
    public class BookingModel : BaseModel
    {
        [Key]
        public int Id { get; set; } 
        public int ResourceId { get; set; } 
        public int ProjectId { get; set; } 
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public int UnitType { get; set; } 
        public double Effort { get; set; } 
        public double EffortHrs { get; set; } 
        public double EffortAvg { get; set; } 
        public bool Billable { get; set; } 
        public bool Fixed { get; set; } 
        public bool Hourly { get; set; } 
        public double BillingRate { get; set; }
        public bool Confirmed { get; set; } 
        public bool OverLoaded { get; set; }
        public string BookedBy { get; set; }
        public DateTime BookedOn { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }  
        public int roleid { get; set; }
        public string BookingColor { get; set; }
    }
}