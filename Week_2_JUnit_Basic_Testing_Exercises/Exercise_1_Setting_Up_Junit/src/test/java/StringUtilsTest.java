import org.junit.Test;
import static org.junit.Assert.*;

public class StringUtilsTest {

    @Test
    public void testIsPalindrome_withPalindrome() {
        StringUtils utils = new StringUtils();
        assertTrue(utils.isPalindrome("Madam"));
    }

    @Test
    public void testIsPalindrome_withNonPalindrome() {
        StringUtils utils = new StringUtils();
        assertFalse(utils.isPalindrome("Hello"));
    }

    @Test
    public void testIsPalindrome_withSpaces() {
        StringUtils utils = new StringUtils();
        assertTrue(utils.isPalindrome("A man a plan a canal Panama"));
    }

    @Test
    public void testIsPalindrome_withNull() {
        StringUtils utils = new StringUtils();
        assertFalse(utils.isPalindrome(null));
    }
}