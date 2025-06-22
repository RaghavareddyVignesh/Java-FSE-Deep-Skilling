import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter Present Value (PV): ");
        double PV = scanner.nextDouble();

        System.out.print("Enter annual growth rate (in %, e.g., 5 for 5%): ");
        double ratePercent = scanner.nextDouble();
        double r = ratePercent / 100;

        System.out.print("Enter number of periods (n): ");
        int n = scanner.nextInt();

        System.out.println("\n--- Financial Forecast Results ---");

        double FV_recursive = FinancialForecast.futureValueRecursive(PV, r, n);
        System.out.printf("Using Recursive Method: %.2f%n", FV_recursive);

        double FV_iterative = FinancialForecast.futureValueIterative(PV, r, n);
        System.out.printf("Using Iterative Method: %.2f%n", FV_iterative);

        double FV_optimized = FinancialForecast.futureValueOptimized(PV, r, n);
        System.out.printf("Using Optimized (Math.pow): %.2f%n", FV_optimized);

        scanner.close();
    }
}