using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eResourceWeb.Models
{

    public class ResourceMaster
    {
        [Key]
        public int ResourceId { get; set; }
        public string ResourceName { get; set; }

        public virtual ICollection<ResourceMaster> Resources { get; set; }
       
    }
}
