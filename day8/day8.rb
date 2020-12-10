arr = File.open("day8.txt").map(&:chomp)

ran_instructions = Array.new

accu = 0
current_ins = "nop +355"
index ||= 0

until ran_instructions.include? index do
    
    instruction = current_ins[0...3].to_s
    ran_instructions.push(index)

    case instruction
        when "acc" 
            accu += current_ins[4..].to_i
            index += 1
            
        when "jmp"
            index += current_ins[4..].to_i

        when "nop"
            index += 1
    end
    current_ins = arr[index]
end

puts "Part 1: #{accu}"
