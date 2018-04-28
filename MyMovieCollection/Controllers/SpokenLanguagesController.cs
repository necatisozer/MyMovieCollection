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
    public class SpokenLanguagesController : Controller
    {
        private MovieDatabaseEntities db = new MovieDatabaseEntities();

        // GET: SpokenLanguages
        public ActionResult Index()
        {
            return View(db.SpokenLanguages.ToList());
        }

        // GET: SpokenLanguages/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SpokenLanguage spokenLanguage = db.SpokenLanguages.Find(id);
            if (spokenLanguage == null)
            {
                return HttpNotFound();
            }
            return View(spokenLanguage);
        }

        // GET: SpokenLanguages/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SpokenLanguages/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "iso_639_1,name")] SpokenLanguage spokenLanguage)
        {
            if (ModelState.IsValid)
            {
                db.SpokenLanguages.Add(spokenLanguage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(spokenLanguage);
        }

        // GET: SpokenLanguages/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SpokenLanguage spokenLanguage = db.SpokenLanguages.Find(id);
            if (spokenLanguage == null)
            {
                return HttpNotFound();
            }
            return View(spokenLanguage);
        }

        // POST: SpokenLanguages/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "iso_639_1,name")] SpokenLanguage spokenLanguage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(spokenLanguage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(spokenLanguage);
        }

        // GET: SpokenLanguages/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SpokenLanguage spokenLanguage = db.SpokenLanguages.Find(id);
            if (spokenLanguage == null)
            {
                return HttpNotFound();
            }
            return View(spokenLanguage);
        }

        // POST: SpokenLanguages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            SpokenLanguage spokenLanguage = db.SpokenLanguages.Find(id);
            db.SpokenLanguages.Remove(spokenLanguage);
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
