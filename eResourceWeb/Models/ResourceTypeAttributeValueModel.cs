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
        public int AttributeValueId { get; set; }
        public int AttributeId { get; set; }
        public string AttributeValue { get; set; }

    }
}