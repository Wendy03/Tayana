using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Tayana
{
    public class Validator
    {
        public static bool IsValidEmail(string email)
        {
            string pattern = @"^[a-zA-Z0-90-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$";
            return Regex.IsMatch(email, pattern);
        }
    }
}