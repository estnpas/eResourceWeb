using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eResourceWeb.Models
{
    [Table("ResourceTypeAttribute")]
    public class ResourceTypeAttributeModel : BaseModel
    {

        [Key]
        public Double Id { get; set; }
        public Double ResourceTypeId { get; set; }
        public string Name { get; set; }

    }
}