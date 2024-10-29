package main

import (
	"fmt"
	"math"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Println("Usage: go run sieve.go <max>")
		return
	}

	maxStr := os.Args[1]
	max, err := strconv.Atoi(maxStr)
	if err != nil || max < 2 {
		fmt.Println("Please provide a valid positive integer greater than 1 as the maximum value.")
		return
	}

	prime := Sieve(max)
	fmt.Println(max,"以下の最も大きな素数は", prime)
}

// Sieve performs the Sieve of Eratosthenes algorithm to find prime numbers.
func Sieve(max int) int {
	if max < 2 {
		return 2
	}

	// Create a slice to track prime candidates
	isPrime := make([]bool, max+1)
	for i := 2; i <= max; i++ {
		isPrime[i] = true
	}

	// Calculate the square root of max
	sqrtMax := int(math.Sqrt(float64(max)))

	// Perform the Sieve of Eratosthenes
	for i := 2; i <= sqrtMax; i++ {
		if isPrime[i] {
			for j := i * i; j <= max; j += i {
				isPrime[j] = false
			}
		}
	}

	// Return the largest prime number.
	for i := max; i > 1; i-- {
		if isPrime[i] {
			return i
		}
	}
	return 1
}
