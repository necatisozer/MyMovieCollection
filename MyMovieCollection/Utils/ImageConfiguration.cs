using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyMovieCollection.Utils
{
    public class ImageConfiguration
    {
        public static string secure_base_url = "https://image.tmdb.org/t/p/";
        public static List<string> poster_sizes = new List<string>(new string[] { "w92", "w154", "w185", "w342", "w500", "w780", "original" });
        public static string imdb_base_title_url = "https://www.imdb.com/title/";
    }
}