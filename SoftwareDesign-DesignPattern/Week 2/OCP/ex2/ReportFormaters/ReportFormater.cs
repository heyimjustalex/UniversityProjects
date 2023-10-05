using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using ex2.Entity;

namespace ex2.ReportFormaters
{
    abstract class ReportFormater : IReportFormater
    {
        public abstract void printFormatedText(List<Employee> employees);

        protected void printAllFieldsOfObject<T>(List<T>objects, Func<List<PropertyInfo>, List<PropertyInfo>> listOfFieldsCustomModificator = null)
        {
            if (listOfFieldsCustomModificator == null)
            {
                // Default behavior: lamda that returns the original list of PropertyInfo
                listOfFieldsCustomModificator = properties => properties;
            }

            foreach (var o in objects)
            {
                Type type = o.GetType();
                PropertyInfo[] propertiesTemp = type.GetProperties();
                List<PropertyInfo> properties = new List<PropertyInfo>(propertiesTemp);

                // lambda usage
                properties = listOfFieldsCustomModificator.Invoke(properties);

                foreach (PropertyInfo p in properties)
                {
                    Console.WriteLine(p.Name + " : " + p.GetValue(o));
                }
                Console.WriteLine("\n------------------\n");
            }
        }
    }

}
