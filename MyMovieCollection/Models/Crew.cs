//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyMovieCollection.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Crew
    {
        public int movie_id { get; set; }
        public string department { get; set; }
        public int person_id { get; set; }
        public string job { get; set; }
    
        public virtual Movie Movie { get; set; }
        public virtual Person Person { get; set; }
    }
}
