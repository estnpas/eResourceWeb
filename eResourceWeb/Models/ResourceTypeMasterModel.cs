using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eResourceWeb.Models
{
    [Table("ResourceTypeMaster")]
    public class ResourceTypeMasterModel : BaseModel
    {

        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public int IsHuman { get; set; }

    }
}