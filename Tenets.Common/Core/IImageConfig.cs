using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.Core
{
    public interface IImageConfig
    {
        string SaveImage(string imgBase64, string imgName, string imgExtension, string folderName);
        string ConvertToBase64String(string fileName, string extension, string folderName);
        string ConvertToBase64StringOnly(string fileName, string folderName);
        void RemoveImage(string fileName, string folderName);
    }
}
