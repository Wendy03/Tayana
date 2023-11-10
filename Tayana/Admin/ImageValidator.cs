using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tayana
{
    public class ImageValidator
    {
        public static bool IsValidFile(string fileName)
        {
            string fileExtension = System.IO.Path.GetExtension(fileName).ToLower();
            string[] restrictExtension = { ".gif", ".jpg", ".bmp", ".png" };

            return restrictExtension.Contains(fileExtension);
        }

        public static bool IsValidFileSize(long fileSize)
        {
            const long maxSize = 10 * 1024 * 1024; // 10MB

            return fileSize <= maxSize;
        }

        public static string SaveImage(string fileName)
        {
            string fileExtension = System.IO.Path.GetExtension(fileName).ToLower();
            string newFileName = String.Format("{0:yyyyMMddhhmmsss}{1}", DateTime.Now, fileExtension);
            return newFileName;
        }
    }
}