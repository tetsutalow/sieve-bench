import java.util.Arrays;

public class sieve {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.out.println("Please provide an upper limit.");
            return;
        }

        int max = Integer.parseInt(args[0]);
        boolean[] isPrime = new boolean[max + 1];
        Arrays.fill(isPrime, true);
        isPrime[0] = false;
        isPrime[1] = false;
        int i=0;

        for (i = 2; i * i <= max; i++) {
            if (isPrime[i]) {
                for (int j = i * i; j <= max; j += i) {
                    isPrime[j] = false;
                }
            }
        }

        for (i = max; i > 2; i--) {
            if (isPrime[i]) {
                break;
            }
        }
        System.out.println(max + "以下で最も大きな素数は" + i);
    }
}
