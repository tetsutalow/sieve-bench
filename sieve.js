// エラトステネスの篩を使って素数を求める関数
function sieveOfEratosthenes(max) {
    // 初期化
    let sieve = new Array(max + 1).fill(true);
    sieve[0] = sieve[1] = false; // 0と1は素数ではない

    // エラトステネスの篩
    for (let i = 2; i * i <= max; i++) {
        if (sieve[i]) {
            for (let j = i * i; j <= max; j += i) {
                sieve[j] = false;
            }
        }
    }

    // 最大の素数を返す
    for (let i = max; i > 1; i--) {
        if (sieve[i]) {
            return i; 
        }
    }

    return primes;
}

// コマンドライン引数から範囲を取得
const max = process.argv[2] ? parseInt(process.argv[2], 10) : 100;
const prime = sieveOfEratosthenes(max);

// 素数を出力
console.log(`${max}以下で最大の素数は${prime}`);
