public class StringUtils {
    public boolean isPalindrome(String input) {
        if (input == null) return false;
        String clean = input.replaceAll("\\s+", "").toLowerCase();
        StringBuilder reversed = new StringBuilder(clean).reverse();
        return clean.equals(reversed.toString());
    }
}