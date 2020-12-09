numbers = File.open("day9.txt").map(&:chomp).map(&:to_i)

# This loop solves part 1
index,part1 = -1,nil
numbers.each do |number|
    index += 1
    next if index < 25

    arr = numbers[index-25..index-1]
    found = false
    arr.each{|x| (found = true;break) if arr.include?((number-x))}

    next if found

    puts "Part 1: #{number}"
    part1 ||= number
    break
end


# This loop solves part 2
total,main_index,temp_index = 0,0,0
until total == part1 do    
    total += numbers[main_index + temp_index]
    temp_index += 1

    if total > part1
        temp_index = 0
        main_index += 1
        total = 0
    end
end

solution_arr = numbers[main_index...main_index+temp_index]
puts "Part 2: #{solution_arr.min + solution_arr.max}"