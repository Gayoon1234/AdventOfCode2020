navigation = File.open('day12.txt').map(&:chomp)

@ship_x, @ship_y = 0, 0
@way_point_x, @way_point_y = 10, 1

def way_point_movement(direction, magnitude)
    case direction
    when 'N' then @way_point_y += magnitude
    when 'E' then @way_point_x += magnitude
    when 'S' then @way_point_y -= magnitude
    when 'W' then @way_point_x -= magnitude    
    end
end

def rotation(direction, angle)   
    angle = 360 - angle if direction == 'R'
    angle_r = (angle*Math::PI)/180

    x, y = @way_point_x ,@way_point_y
    @way_point_x = (x*Math.cos(angle_r) - y*Math.sin(angle_r)).round
    @way_point_y = (y*Math.cos(angle_r) + x*Math.sin(angle_r)).round
end

def forward(distance)
    @ship_x += distance*@way_point_x
    @ship_y += distance*@way_point_y   
end

navigation.each do |instruction|
    direction = instruction[0]
    magnitude = instruction[1..].to_i

    case direction
        when 'F' then forward(magnitude)
        when 'L', 'R' then rotation(direction, magnitude)
        else 
            way_point_movement(direction, magnitude)
    end
end

puts "Part 2: #{@ship_x.abs + @ship_y.abs}"
