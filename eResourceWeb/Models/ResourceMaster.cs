using System;
using System.Collections.Generic;

namespace eResourceWeb.Models
{

    /// <summary>
    /// Summary description for ResourceMaster
    /// </summary>
    public class ResourceMaster
    {
 
        public float ResourceId { get; set; }
        public string ResourceName { get; set; }

        public virtual ICollection<ResourceMaster> Resources { get; set; }
       
    }
}
