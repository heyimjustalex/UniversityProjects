package exceptions.normalflow;

class ExpenseReportDAO {
    
    public MealExpenses getMeals(long id) {
        return new MealExpenses();
    }
}

class MealExpenses { 
    
    public int getTotal() {
        return 0;
    }
}

class Employee {
    int id;

    public int getId() {
        return id;
    }
}

public class Demo {

    static ExpenseReportDAO expenseReportDAO = new ExpenseReportDAO();
    static Employee employee = new Employee();
    static int total = 0;
    
    public static void main(String[] args) {
        
        try {
            MealExpenses expenses = expenseReportDAO.getMeals(employee.getId());
            total += expenses.getTotal();
        } catch (MealExpensesNotFoundException e) {
            total += getMealPerDiem();
        }
    }

    private static int getMealPerDiem() {
        return 0;
    }
}

class MealExpensesNotFoundException extends RuntimeException {

}
