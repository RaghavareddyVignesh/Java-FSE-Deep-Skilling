public class Main {
    public static void main(String[] args) {
        Order[] orders = {
                new Order(101, "Alice", 250.0),
                new Order(102, "Bob", 75.5),
                new Order(103, "Charlie", 400.25),
                new Order(104, "Diana", 300.0)
        };

        System.out.println("Original Orders:");
        SortingAlgorithm.displayOrders(orders);

        System.out.println("\nSorted by Bubble Sort (Descending):");
        SortingAlgorithm.bubbleSort(orders);
        SortingAlgorithm.displayOrders(orders);

        // Reset array for quick sort demonstration
        orders = new Order[] {
                new Order(101, "Alice", 250.0),
                new Order(102, "Bob", 75.5),
                new Order(103, "Charlie", 400.25),
                new Order(104, "Diana", 300.0)
        };

        System.out.println("\nSorted by Quick Sort (Descending):");
        SortingAlgorithm.quickSort(orders, 0, orders.length - 1);
        SortingAlgorithm.displayOrders(orders);
    }
}