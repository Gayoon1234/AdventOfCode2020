navigation = File.open('day12.txt').map(&:chomp)

@start_x, @start_y = 0, 0
directions = ['N', 'E', 'S', 'W']
facing = 1

def turning(direction, angle, facing)
    angle *= -1 if direction == 'L'
    (facing + (angle/90))%4
end

def compass_movement(direction, magnitude)
    case direction
        when 'N' then @start_y -= magnitude
        when 'E' then @start_x += magnitude
        when 'S' then @start_y += magnitude
        when 'W' then @start_x -= magnitude
    end

end

navigation.each do |instruction|

    direction = instruction[0]
    magnitude = instruction[1..].to_i

    case direction
        when 'L', 'R' then facing = turning(direction, magnitude, facing)
        when 'F'
            compass_movement(directions[facing],magnitude)
        else
            compass_movement(direction, magnitude)
    end
end

puts "Part 1: #{@start_x.abs + @start_y.abs}"