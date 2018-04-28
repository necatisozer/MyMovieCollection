﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MyMovieCollection.Models;

namespace MyMovieCollection.Controllers
{
    public class ProductionCompaniesController : Controller
    {
        private MovieDatabaseEntities db = new MovieDatabaseEntities();

        // GET: ProductionCompanies
        public ActionResult Index()
        {
            return View(db.ProductionCompanies.ToList());
        }

        // GET: ProductionCompanies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductionCompany productionCompany = db.ProductionCompanies.Find(id);
            if (productionCompany == null)
            {
                return HttpNotFound();
            }
            return View(productionCompany);
        }

        // GET: ProductionCompanies/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductionCompanies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "description,headquarters,homepage,id,logo_path,name,origin_country")] ProductionCompany productionCompany)
        {
            if (ModelState.IsValid)
            {
                db.ProductionCompanies.Add(productionCompany);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(productionCompany);
        }

        // GET: ProductionCompanies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductionCompany productionCompany = db.ProductionCompanies.Find(id);
            if (productionCompany == null)
            {
                return HttpNotFound();
            }
            return View(productionCompany);
        }

        // POST: ProductionCompanies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "description,headquarters,homepage,id,logo_path,name,origin_country")] ProductionCompany productionCompany)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productionCompany).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(productionCompany);
        }

        // GET: ProductionCompanies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductionCompany productionCompany = db.ProductionCompanies.Find(id);
            if (productionCompany == null)
            {
                return HttpNotFound();
            }
            return View(productionCompany);
        }

        // POST: ProductionCompanies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductionCompany productionCompany = db.ProductionCompanies.Find(id);
            db.ProductionCompanies.Remove(productionCompany);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
