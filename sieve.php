<?php
function sieveOfEratosthenes($max) {
    // 初期化
    $sieve = array_fill(0, $max + 1, true);
    $sieve[0] = $sieve[1] = false; // 0と1は素数ではない

    // エラトステネスの篩
    for ($i = 2; $i * $i <= $max; $i++) {
        if ($sieve[$i]) {
            for ($j = $i * $i; $j <= $max; $j += $i) {
                $sieve[$j] = false;
            }
        }
    }

    // 最大の素数を探す
    for ($i = $max; $i > 2; $i--) {
        if ($sieve[$i]) {
            return $i;
        }
    }

    return $i;
}

// コマンドライン引数から範囲を取得
$max = isset($argv[1]) ? (int)$argv[1] : 100;
$prime = sieveOfEratosthenes($max);

// 素数を出力
echo "$max 以下で最も大きな素数は $prime\n";
?>
