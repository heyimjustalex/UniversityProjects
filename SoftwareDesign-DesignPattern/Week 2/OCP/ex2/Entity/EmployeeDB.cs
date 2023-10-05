using System.Collections.Generic;

namespace ex2.Entity
{
    public class EmployeeDB
    {
        private readonly List<Employee> _employees;
        private int _currentEmployeeIndex;

        public EmployeeDB()
        {
            _employees = new List<Employee>();
            Reset();
        }

        public List<Employee> GetAllEmployees()
        {
            return new List<Employee>(_employees);
        }

        public void Reset()
        {
            _currentEmployeeIndex = 0;
        }

        public Employee GetNextEmployee()
        {
            if (_currentEmployeeIndex == _employees.Count)
                return null;
            return _employees[_currentEmployeeIndex++];
        }

        public void AddEmployee(Employee employee)
        {
            _employees.Add(employee);
        }
    }
}