package signup;
import java.util.Random;

public class accnum {
    public static String generateAccountNumber() {
        int length = 10;
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder accountNumber = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            accountNumber.append(characters.charAt(index));
        }

        return accountNumber.toString();
    }
}

