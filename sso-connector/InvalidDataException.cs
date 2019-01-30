using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class InvalidDataException : Exception
    {
        public InvalidDataException(string error) : base(error)
        {

        }
    }
}