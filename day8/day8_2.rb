arr = File.open("day8.txt").map(&:chomp)

replacement = Hash.new
replacement["jmp"] = "nop"
replacement["nop"] = "jmp"


def check_if_recursive(test_array)
    accu = 0
    indexes_checked = Array.new
    current_index = 0

    until indexes_checked.include? current_index do

        if current_index >= test_array.length
            return accu
        end

        instruction = test_array[current_index][0...3].to_s
        indexes_checked.push(current_index)

        case instruction
            when "acc" 
                if test_array[current_index][4].to_s == "+"
                    accu += test_array[current_index][5..].to_i
                else
                    accu -= test_array[current_index][5..].to_i
                end
                
                current_index += 1
            when "jmp"
                if test_array[current_index][4].to_s == "+"
                    current_index += test_array[current_index][5..].to_i
                else
                    current_index -= test_array[current_index][5..].to_i
                end
            when "nop"
                current_index += 1
        end

    end

    return -1
end



index = -1
arr.each do |line|

    index += 1

    next if line[0...3].to_s == "acc"
           
    arr2 = File.open("day8.txt").map(&:chomp)
    arr2[index].sub! line[0...3],replacement[line[0...3]]

    puts check_if_recursive(arr2) if check_if_recursive(arr2) != -1

end