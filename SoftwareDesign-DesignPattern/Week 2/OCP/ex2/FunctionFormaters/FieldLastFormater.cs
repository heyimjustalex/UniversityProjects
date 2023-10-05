using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ex2.FunctionFormaters
{
    public class FieldLastFormater : IFunctionFormater
    {
        public Func<List<PropertyInfo>, List<PropertyInfo>> formater(string fieldNameToBeModified)
        {
            return (List<PropertyInfo> classFields) =>
            {
                int ind = 0;
                string fieldName = fieldNameToBeModified; // Store the fieldName to be modified
                foreach (PropertyInfo p in classFields)
                {
                    if (p.Name == fieldName)
                    {
                        classFields.Add(p);
                        classFields.RemoveAt(ind);
                        break; // Exit the loop once the field is moved to the last position
                    }
                    ind++;
                }
                return classFields;
            };
        }
    }
}
