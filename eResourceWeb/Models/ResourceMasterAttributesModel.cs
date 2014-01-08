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
        public int Id { get; }
        public int ResourceId { get; set; }
        public int AttributeId { get; set; }
        public int AttributeValueId { get; set; }

    }
}