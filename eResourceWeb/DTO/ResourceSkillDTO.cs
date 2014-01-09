using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eResourceWeb.DTO
{
    public class ResourceSkillDTO : BaseDTO
    {
        private int ResourceId { get; set; }
        private int SkillGroupId { get; set; }
        private string SkillGroupName { get; set; }
        private int SkillId { get; set; }
        private string SkillName { get; set; }
    }
}