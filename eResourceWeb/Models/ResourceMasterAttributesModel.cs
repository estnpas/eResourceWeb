using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace eResourceWeb.Models
{
    [Table("ResourceMasterAttributes")]
    public class ResourceMasterAttributesModel : BaseModel
    {

        [Key]
        public Double Id { get; set; }
        public Double ResourceId { get; set; }
        public Double AttributeId { get; set; }
        public Double AttributeValueId { get; set; }

    }
}