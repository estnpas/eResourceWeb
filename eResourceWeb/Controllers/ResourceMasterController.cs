using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eResourceWeb.DAL;

namespace eResourceWeb.Controllers
{
    private eResourceWebContext db = new eResourceWebContext();

    public class ResourceMasterController : Controller
    {
        //
        // GET: /ResourceMaster/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /ResourceMaster/Details/5

        public ActionResult Details(int id)
        {
            return View();
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
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /ResourceMaster/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /ResourceMaster/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /ResourceMaster/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /ResourceMaster/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
