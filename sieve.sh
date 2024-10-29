#!/bin/bash
clear
MAX=100000000
echo 色々な言語でエラトステネスのふるいを使って $MAX までの素数を求めます。
sleep 3
echo ""
echo Cによるプログラム
sleep 3
cat sieve.c
sleep 3
echo ""
echo Cはコンパイル言語なのでコンパイルします clang -O3 -o sieve-c sieve.c
time clang -O3 -o sieve-c sieve.c
sleep 3
echo ""
echo 実行します ./sieve-c $MAX
time ./sieve-c $MAX
sleep 3
echo ""
echo ""
echo Python3
echo ""
sleep 3
cat sieve.py
sleep 3
echo ""
echo インタプリタ言語なのでそのまま実行します python3 sieve.py $MAX
time python3 sieve.py $MAX
sleep 3
echo ""
echo ""
echo Java
echo ""
sleep 3
cat sieve.java
sleep 3
echo ""
echo Javaは中間言語方式のコンパイル言語なのでまずコンパイルします javac sieve.java
echo ""
time javac sieve.java
echo ""
echo 次に中間言語を実行します。インタプリタですがJIT Compilerが使われています java sieve $MAX
time java sieve $MAX
sleep 3
echo ""
echo ""
echo JavaScript
sleep 3
cat sieve.js
sleep 3
echo ""
echo JavaScriptはインタプリタ言語なのでそのまま実行します
echo まずJITなしで node --max-old-space-size=8192 --jitless sieve.js $MAX
echo ""
time node --max-old-space-size=8192 --jitless sieve.js $MAX
echo ""
echo "次にJIT(Just In Time Compiler)を利用します。node --max-old-space-size=8192 sieve.js $MAX"
echo ""
time node --max-old-space-size=8192 sieve.js $MAX
echo ""
echo ""
echo PHP
sleep 3
cat sieve.php
sleep 3
echo ""
echo "PHPはインタプリタ言語なのでそのまま実行します(JITが有効になっています) php sieve.php $MAX"
echo ""
time php sieve.php $MAX
echo ""
echo ""
echo Lua
sleep 3
cat sieve.lua
sleep 3
echo ""
echo "Luaはインタプリタ言語なのでそのまま実行します lua sieve.lua $MAX"
echo ""
time lua sieve.lua $MAX
echo ""
echo "LuaのJIT COmpilerであるluajitで実行します luajit sieve.lua $MAX"
echo ""
time luajit sieve.lua $MAX
echo ""
echo ""
echo Go
sleep 3
cat sieve.go
sleep 3
echo ""
echo "Goはコンパイル言語なのでまずコンパイルします go build -o sieve-go sieve.go"
echo ""
time go build -o build-go sieve.go
echo ""
echo "実行します ./sieve-go $MAX"
echo ""
time ./build-go $MAX
echo ""
echo ""
echo Rust
sleep 3
cat sieve/src/main.rs
sleep 3
echo ""
echo "Rustはコンパイル言語なのでまずコンパイルします cargo build --release"
echo ""
(cd sieve; cargo clean)
time (cd sieve; cargo build --release)
echo ""
echo "実行します ./target/release/sieve $MAX"
echo ""
time (cd sieve; ./target/release/sieve $MAX)
