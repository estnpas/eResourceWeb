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
    public class ResourceMasterAttributesController : Controller
    {
        private ResourceWebContext db = new ResourceWebContext();

        //
        // GET: /ResourceMasterAttributes/

        public ActionResult Index()
        {
            return View(db.ResourceMasterAttributesModels.ToList());
        }

        //
        // GET: /ResourceMasterAttributes/Details/5

        public ActionResult Details(int id = 0)
        {
            ResourceMasterAttributesModel resourcemasterattributesmodel = db.ResourceMasterAttributesModels.Find(id);
            if (resourcemasterattributesmodel == null)
            {
                return HttpNotFound();
            }
            return View(resourcemasterattributesmodel);
        }

        //
        // GET: /ResourceMasterAttributes/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ResourceMasterAttributes/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ResourceMasterAttributesModel resourcemasterattributesmodel)
        {
            if (ModelState.IsValid)
            {
                db.ResourceMasterAttributesModels.Add(resourcemasterattributesmodel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(resourcemasterattributesmodel);
        }

        //
        // GET: /ResourceMasterAttributes/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ResourceMasterAttributesModel resourcemasterattributesmodel = db.ResourceMasterAttributesModels.Find(id);
            if (resourcemasterattributesmodel == null)
            {
                return HttpNotFound();
            }
            return View(resourcemasterattributesmodel);
        }

        //
        // POST: /ResourceMasterAttributes/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ResourceMasterAttributesModel resourcemasterattributesmodel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(resourcemasterattributesmodel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(resourcemasterattributesmodel);
        }

        //
        // GET: /ResourceMasterAttributes/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ResourceMasterAttributesModel resourcemasterattributesmodel = db.ResourceMasterAttributesModels.Find(id);
            if (resourcemasterattributesmodel == null)
            {
                return HttpNotFound();
            }
            return View(resourcemasterattributesmodel);
        }

        //
        // POST: /ResourceMasterAttributes/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ResourceMasterAttributesModel resourcemasterattributesmodel = db.ResourceMasterAttributesModels.Find(id);
            db.ResourceMasterAttributesModels.Remove(resourcemasterattributesmodel);
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