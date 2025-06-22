public class FinancialForecast {
    public static double futureValueRecursive(double PV, double r, int n) {
        if (n == 0) {
            return PV;
        }
        return (1 + r) * futureValueRecursive(PV, r, n - 1);
    }
    public static double futureValueIterative(double PV, double r, int n) {
        double result = PV;
        for (int i = 0; i < n; i++) {
            result *= (1 + r);
        }
        return result;
    }
    public static double futureValueOptimized(double PV, double r, int n) {
        return PV * Math.pow(1 + r, n);
    }
}