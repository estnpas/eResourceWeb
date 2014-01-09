using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eResourceWeb.Models;
using eResourceWeb.DAL;

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

            //return View(db.ResourceMaster.ToList<ResourceMaster>());
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