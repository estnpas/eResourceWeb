using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eResourceWeb.Controllers
{
    public class ResourceMasterSkillController : Controller
    {

        private eResourceWeb.DAL.ResourceWebContext db = new eResourceWeb.DAL.ResourceWebContext();

        //
        // GET: /ResourceMasterSkill/

        public ActionResult Index()
        {
            return View();
        }

        //
        //  POST: /Resource//Master/Unassign

        [HttpPost, ActionName("Unassign")]
        [ValidateAntiForgeryToken]
        public ActionResult Unassign(int resourceId, int skillGroupId, int skillId)
        {
            //  p0 = ResourceId
            //  p1 = skillGroupId
            //  p1 = SkillId
            string unassignQuery = "DELETE "
                                    + "FROM ResourceMasterAttributes RMA "
                                    + "WHERE RMA.ResourceId = @p0 "
                                    + " AND RMA.AttributeId = @p1"
                                    + " AND RMA.AttributeValueId = @p2";
            db.Database.ExecuteSqlCommand(unassignQuery,
                                                resourceId,
                                                skillGroupId,
                                                skillId);

            db.SaveChanges();

            return RedirectToAction("Index");
        }

    }
}
