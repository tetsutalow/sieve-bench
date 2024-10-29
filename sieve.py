import sys

def sieve_of_eratosthenes(n):
    prime = [True for _ in range(n+1)]
    p = 2
    while p * p <= n:
        if prime[p]:
            for i in range(p * p, n+1, p):
                prime[i] = False
        p += 1

    for i in range(n,0,-1):
        if prime[i]:
            return i
    return 1

if __name__ == "__main__":
    n = int(sys.argv[1])
    prime_number = sieve_of_eratosthenes(n)
    print(f"{n}以下で最も大きな素数は{prime_number}")
