import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        EmployeeManagement management = new EmployeeManagement(10); // capacity = 10
        Scanner scanner = new Scanner(System.in);

        management.addEmployee(new Employee(1, "Alice", "Manager", 75000));
        management.addEmployee(new Employee(2, "Bob", "Developer", 60000));
        management.addEmployee(new Employee(3, "Charlie", "Designer", 50000));

        System.out.println("\nAll Employees:");
        management.displayAllEmployees();

        System.out.print("\nEnter Employee ID to search: ");
        int searchId = scanner.nextInt();
        Employee found = management.searchEmployee(searchId);
        System.out.println(found != null ? found : "Employee not found.");

        System.out.print("\nEnter Employee ID to delete: ");
        int deleteId = scanner.nextInt();
        management.deleteEmployee(deleteId);

        System.out.println("\nAll Employees after deletion:");
        management.displayAllEmployees();

        scanner.close();
    }
}