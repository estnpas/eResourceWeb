using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eResourceWeb.Models
{
    public abstract class BaseModel
    {
        public DateTime Last_Updated { get; set; }
        public int Is_Deleted { get; set; }
        public string ModifiedBy { get; set; }
    }
}