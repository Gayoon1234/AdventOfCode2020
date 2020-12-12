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
