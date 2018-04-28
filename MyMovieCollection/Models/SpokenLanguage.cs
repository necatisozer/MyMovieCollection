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
    using System.ComponentModel.DataAnnotations;

    [MetadataType(typeof(SpokenLanguageMetaData))]
    public partial class SpokenLanguage
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SpokenLanguage()
        {
            this.Movies = new HashSet<Movie>();
        }
    
        public string iso_639_1 { get; set; }
        public string name { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Movie> Movies { get; set; }
    }

    public class SpokenLanguageMetaData
    {
        [Display(Name = "ISO 639-1")]
        public string iso_639_1 { get; set; }
        [Display(Name = "Name")]
        public string name { get; set; }
    }
}
