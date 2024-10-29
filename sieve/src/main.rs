use std::env;

fn sieve_of_eratosthenes(max: usize) -> usize {
    let mut sieve = vec![true; max + 1];
    sieve[0] = false;
    sieve[1] = false;

    for i in 2..=((max as f64).sqrt() as usize) {
        if sieve[i] {
            for j in (i * i..=max).step_by(i) {
                sieve[j] = false;
            }
        }
    }
    let mut p = max;
    while p > 2 {
        if sieve[p] {
            break;
        }
        p -= 1;
    }
    p
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let max: usize = args.get(1)
        .expect("Please provide an upper limit")
        .parse()
        .expect("Invalid number");

    let prime = sieve_of_eratosthenes(max);
    println!("{}以下の最も大きな素数は{:?}", max, prime);
}
