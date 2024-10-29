-- エラトステネスの篩を使って素数を求める関数
function sieve(n)
    local sieve = {}
    for i = 2, n do
        sieve[i] = true
    end

    for i = 2, math.sqrt(n) do
        if sieve[i] then
            for j = i * i, n, i do
                sieve[j] = false
            end
        end
    end

    for i = n, 2, -1 do
        if sieve[i] then
            return i
        end
    end
    return i
end

-- コマンドライン引数から範囲を取得
local n = tonumber(arg[1])
if not n then
    print("Please provide a valid number as an upper limit.")
    os.exit(1)
end

local prime = sieve(n)
print(n .. "以下で最も大きい素数は" .. prime)
