path = File.open("day3PATH.txt").map(&:chomp)

start, tree_count = 0, 0
path.each do|line| 
    tree_count +=1 if line[start% (line.length)] == "#"
    start += 3
end

puts "Part 1: #{tree_count}"
