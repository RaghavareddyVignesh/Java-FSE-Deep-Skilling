import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Smartphone", "Electronics"),
                new Product(103, "Table", "Furniture"),
                new Product(104, "Chair", "Furniture"),
                new Product(105, "Headphones", "Electronics"),
                new Product(106, "Sofa", "Furniture")
        };

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter product name to search: ");
        String searchQuery = scanner.nextLine();

        System.out.println("\n1. Linear Search Result:");
        Product resultLinear = ProductSearch.linearSearch(products, searchQuery);
        System.out.println(resultLinear != null ? resultLinear : "Product not found");

        System.out.println("\n2. Binary Search Result:");
        Product resultBinary = ProductSearch.binarySearch(products, searchQuery);
        System.out.println(resultBinary != null ? resultBinary : "Product not found");

        scanner.close();
    }
}