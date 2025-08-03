import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class BankAccountTest {

    private BankAccount account;

    @Before
    public void setUp() {
        System.out.println("Setting up new bank account...");
        account = new BankAccount();
    }

    @After
    public void tearDown() {
        System.out.println("Resetting bank account...");
        account.reset();
    }

    @Test
    public void testDeposit() {

        account.deposit(100.0);

        assertEquals(100.0, account.getBalance(), 0.001);
    }

    @Test
    public void testWithdraw() {

        account.deposit(200.0);

        account.withdraw(50.0);

        assertEquals(150.0, account.getBalance(), 0.001);
    }

    @Test
    public void testOverdraftNotAllowed() {

        account.withdraw(100.0); // nothing to withdraw

        assertEquals(0.0, account.getBalance(), 0.001);
    }
}
