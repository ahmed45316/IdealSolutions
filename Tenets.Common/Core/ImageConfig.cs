using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Tenets.Common.Core
{
    public class ImageConfig: IImageConfig
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        public ImageConfig(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }
        public string SaveImage(string imgBase64, string ImgName,string folderName)
        {
            String path = $"{_hostingEnvironment.ContentRootPath}/{folderName}"; //Path

            //Check if directory exist
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path); //Create directory if it doesn't exist
            }
            var imageExtension = imgBase64.Split(',')[0].Split('/')[1].Split(';')[0];
            string imageName = $"{ImgName}.{imageExtension}";

            //set the image path
            string imgPath = Path.Combine(path, imageName);

            byte[] imageBytes = Convert.FromBase64String(imgBase64);

            File.WriteAllBytes(imgPath, imageBytes);

            return imageName;
        }
        public string ConvertToBase64String(string fileName, string folderName)
        {
            try
            {
                string path = $"{_hostingEnvironment.ContentRootPath}/{folderName}/{fileName}";
                byte[] fileByte = File.ReadAllBytes(path);
                var imageExtension = fileName.Split('.')[1];
                return $"data:image/{imageExtension};base64,{Convert.ToBase64String(fileByte)}";
            }
            catch (Exception)
            {
                return "";
            }           
        }
        public string ConvertToBase64StringOnly(string fileName, string folderName)
        {
            string path = $"{_hostingEnvironment.ContentRootPath}/{folderName}/{fileName}";
            byte[] fileByte = File.ReadAllBytes(path);
            return Convert.ToBase64String(fileByte);
        }
        public void RemoveImage(string fileName, string folderName)
        {
            var fullPath = $"{_hostingEnvironment.ContentRootPath}/{folderName}/{fileName}";
            if (File.Exists(fullPath))
            {
                File.Delete(fullPath);
            }
        }
    }
}
