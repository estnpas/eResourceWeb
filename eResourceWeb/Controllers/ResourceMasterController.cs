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

namespace eResourceWeb.Controllers
{
    public class ResourceMasterController : Controller
    {
        private ResourceWebContext db = new ResourceWebContext();

        //
        // GET: /ResourceMaster/

    //    public ActionResult Index(string searchString)
        public ActionResult Index()
        {
            db.Database.Log = Console.Write;
            var resources = from s in db.ResourceMaster 
                            select s;

       //     if (!String.IsNullOrEmpty(searchString))
        //    {
       //         resources = resources.Where(s => s.ResourceName.ToUpper().Contains(searchString.ToUpper()));
       //     }

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
            string managerNameSQLQuery = "select "
                                      + "Id AS Id, "
                                    + "Name AS Name, "
                                    + "ManagerType AS ManagerType "
                                + "FROM dbo.ManagerMaster "
                                + "WHERE Id = @p0 ";
                                //+ "AND ManagerType = 'Resource'";

            var manager = db.Database.SqlQuery<ManagerMasterDTO>(managerNameSQLQuery, resourcemaster.ManagerId).Single();
            resourcemaster.ManagerName = manager.Name;


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

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}