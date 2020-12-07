arr = File.open("day2_passwords.txt", "r").map(&:chomp)
def check_if_valid(low, high, char, string)
    count = 0
    string.split('').each{|c| count += 1 if c == char}
    return true if count >= low.to_i && count <= high.to_i
    
end

def check_if_valid_2(low, high, char, string)
    return true if ((char == string[low.to_i] && char != string[high.to_i]) || 
                    (char != string[low.to_i] && char == string[high.to_i]))
end

counter_part_1, counter_part_2 = 0,0
arr.each do |x|  
    counter_part_1 += 1 if check_if_valid(x[0...x.index("-")], 
                    x[x.index("-")+1...x.index(" ")], 
                    x[x.index(':')-1], 
                    x[x.index(':')+1..])

    counter_part_2 += 1 if check_if_valid_2(x[0...x.index("-")], 
                    x[x.index("-")+1...x.index(" ")], 
                    x[x.index(':')-1], 
                    x[x.index(':')+1..])
end

puts "Part 1: #{counter_part_1} \nPart 2: #{counter_part_2}"
