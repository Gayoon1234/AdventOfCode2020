jolts = File.open("day10.txt").map(&:chomp).map(&:to_i)

current_jolt = 0
ones,threes = 0,0

while true do 
    if jolts.include? current_jolt + 1
        ones += 1
        current_jolt += 1
        next
    elsif jolts.include? current_jolt + 2
        current_jolt += 2
        next
    elsif jolts.include? current_jolt + 3
        threes += 1
        current_jolt += 3
    else
        threes += 1 
        break
    end
end

puts ones*threes



@jolts = File.open("day10.txt").map(&:chomp).map(&:to_i)
@cache = Hash.new


def solve(current_jolt=0)
    return 1 if current_jolt == @jolts.max
    if !@cache.has_key? current_jolt
        n_paths = Array.new
        n_paths.push(solve(current_jolt+1)) if @jolts.include?(current_jolt + 1)
        n_paths.push(solve(current_jolt+2)) if @jolts.include?(current_jolt + 2)
        n_paths.push(solve(current_jolt+3)) if @jolts.include?(current_jolt + 3)
        @cache[current_jolt] = n_paths.sum
    end

    return @cache[current_jolt]
end

puts solve()

