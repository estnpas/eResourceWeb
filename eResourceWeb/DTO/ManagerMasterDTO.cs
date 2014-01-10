using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eResourceWeb.DTO
{
    public class ManagerMasterDTO : BaseDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ManagerType { get; set; }
        
    }
}