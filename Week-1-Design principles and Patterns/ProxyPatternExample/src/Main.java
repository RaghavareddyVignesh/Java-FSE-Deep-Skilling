public class Main {
    public static void main(String[] args) {
        Image img1 = new ProxyImage("photo1.jpg");
        Image img2 = new ProxyImage("photo2.jpg");

        System.out.println("\nFirst time loading Photo1:");
        img1.display();

        System.out.println("\nDisplaying Photo1 again:");
        img1.display();

        System.out.println("\nFirst time loading Photo2:");
        img2.display();

        System.out.println("\nDisplaying Photo2 again:");
        img2.display();
    }
}