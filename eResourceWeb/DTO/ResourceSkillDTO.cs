using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eResourceWeb.DTO
{
    public class ResourceSkillDTO : BaseDTO
    {
        public int SkillGroupId { get; set; }
        public string SkillGroupName { get; set; }
        public int SkillId { get; set; }
        public string SkillName { get; set; }
    }
}