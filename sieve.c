#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


void sieveOfEratosthenes(int n) {
    bool *prime = malloc(n+1);
    for (int i = 0; i <= n; i++) {
        prime[i] = true;
    }

    for (int p = 2; p * p <= n; p++) {
        if (prime[p] == true) {
            for (int i = p * p; i <= n; i += p) {
                prime[i] = false;
            }
        }
    }

    printf("%d 以下で最も大きな素数は", n);
    for (int p = n; p > 2; p--) {
        if (prime[p]) {
            printf("%d\n", p);
            break;
        }
    }
    free(prime);
}

int main(int argc, char **argv) {
    int n=atoi(argv[1]);
    if (n<2) {
        printf("The argument should be more than 1\n");
        exit(1);
    }
    sieveOfEratosthenes(n);
    return 0;
}
