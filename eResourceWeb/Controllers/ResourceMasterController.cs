using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eResourceWeb.Models;
using eResourceWeb.DAL;
using eResourceWeb.DTO;
using eResourceWeb.Services;

namespace eResourceWeb.Controllers
{

    public class ResourceMasterController : Controller
    {
        private ResourceWebContext db = new ResourceWebContext();


        //
        // GET: /ResourceMaster/


        public ActionResult Index()
        {
            db.Database.Log = Console.Write;
            var resources = from s in db.ResourceMaster 
                            select s;

            resources = resources.OrderBy(s => s.ResourceName);

            return View(resources.ToList<ResourceMaster>());
        }

        //
        // GET: /ResourceMaster/Details/5

        public ActionResult Details(int id = 0)
        {
            ResourceMaster resourcemaster = db.ResourceMaster.Find(id);
            

            if (resourcemaster == null)
            {
                return HttpNotFound();
            }

            //  We need to retrieve any associate Skill Inventory information
            string sqlQuery = "select "
                                    + "RTA.Id AS SkillGroupId, "
                                    + "RTA.Name AS SkillGroupName, "
                                    + "RTAV.AttributeValueId AS SkillId, "
                                    + "RTAV.AttributeValue AS SkillName "
                                + "FROM dbo.ResourceMaster RM "
                                + "JOIN dbo.ResourceMasterAttributes RMA "
                                + "ON RMA.ResourceId = RM.ResourceId "
                                + "JOIN dbo.ResourceTypeAttribute RTA "
                                + "ON RM.TypeId = RTA.ResourceTypeId "
                                + "JOIN dbo.ResourceTypeAttributeValue RTAV "
                                + "ON RMA.Id = RTAV.AttributeValueId "
                                + "AND RMA.AttributeId = RTAV.AttributeId "
                                + "WHERE RM.ResourceId = @p0";
            
            var resourceSkills = db.Database.SqlQuery<ResourceSkillDTO>(sqlQuery, id).ToList();
            resourcemaster.skillsList = resourceSkills;

            //  We need to retrieve manager's name
            ManagerService managerService = ManagerService.Instance;
            ManagerMasterDTO mangerObject = managerService.GetManger(resourcemaster.ManagerId);
            if (mangerObject != null)
            {
                resourcemaster.ManagerName = mangerObject.Name;
            }
            else
            {
                resourcemaster.ManagerName = "N/A";
            }
           
             
            return View(resourcemaster);
        }

        //
        // GET: /ResourceMaster/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ResourceMaster/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ResourceMaster resourcemaster)
        {
            if (ModelState.IsValid)
            {
                db.ResourceMaster.Add(resourcemaster);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(resourcemaster);
        }

        //
        // GET: /ResourceMaster/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ResourceMaster resourcemaster = db.ResourceMaster.Find(id);
            if (resourcemaster == null)
            {
                return HttpNotFound();
            }
            return View(resourcemaster);
        }

        //
        // POST: /ResourceMaster/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ResourceMaster resourcemaster)
        {
            if (ModelState.IsValid)
            {
                db.Entry(resourcemaster).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(resourcemaster);
        }

        //
        // GET: /ResourceMaster/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ResourceMaster resourcemaster = db.ResourceMaster.Find(id);
            if (resourcemaster == null)
            {
                return HttpNotFound();
            }
            return View(resourcemaster);
        }

        //
        // POST: /ResourceMaster/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ResourceMaster resourcemaster = db.ResourceMaster.Find(id);
            db.ResourceMaster.Remove(resourcemaster);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        //  GET: /Resource//Master/Unassign
        //[ValidateAntiForgeryToken]  Removed for the moment

        [HttpGet, ActionName("Unassign")]
        public ActionResult Unassign(int resourceId, int Id)
        {
            //  p0 = Id (the unique Resource-Master Attribute ID)
            string unassignQuery = "DELETE "
                                    + "FROM dbo.ResourceMasterAttributes "
                                    + "WHERE Id = @p0";
                                    
            db.Database.ExecuteSqlCommand(unassignQuery, 
                                                Id);
 
            db.SaveChanges();

            return RedirectToAction("Details", new { Id = resourceId });
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}