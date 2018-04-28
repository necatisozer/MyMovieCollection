using System;
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
    public class ProductionCountriesController : Controller
    {
        private MovieDatabaseEntities db = new MovieDatabaseEntities();

        // GET: ProductionCountries
        public ActionResult Index()
        {
            return View(db.ProductionCountries.ToList());
        }

        // GET: ProductionCountries/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductionCountry productionCountry = db.ProductionCountries.Find(id);
            if (productionCountry == null)
            {
                return HttpNotFound();
            }
            return View(productionCountry);
        }

        // GET: ProductionCountries/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductionCountries/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "iso_3166_1,name")] ProductionCountry productionCountry)
        {
            if (ModelState.IsValid)
            {
                db.ProductionCountries.Add(productionCountry);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(productionCountry);
        }

        // GET: ProductionCountries/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductionCountry productionCountry = db.ProductionCountries.Find(id);
            if (productionCountry == null)
            {
                return HttpNotFound();
            }
            return View(productionCountry);
        }

        // POST: ProductionCountries/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "iso_3166_1,name")] ProductionCountry productionCountry)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productionCountry).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(productionCountry);
        }

        // GET: ProductionCountries/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductionCountry productionCountry = db.ProductionCountries.Find(id);
            if (productionCountry == null)
            {
                return HttpNotFound();
            }
            return View(productionCountry);
        }

        // POST: ProductionCountries/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            ProductionCountry productionCountry = db.ProductionCountries.Find(id);
            db.ProductionCountries.Remove(productionCountry);
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
