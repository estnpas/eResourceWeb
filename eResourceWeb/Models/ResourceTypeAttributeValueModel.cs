using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eResourceWeb.Models
{
    [Table("ResourceTypeAttributeValue")]
    public class ResourceTypeAttributeValueModel : BaseModel
    {

        [Key]
        public Double AttributeValueId { get; set; }
        public Double AttributeId { get; set; }
        public string AttributeValue { get; set; }

    }
}