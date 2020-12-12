array = File.open("day11.txt").map(&:chomp)

def Game_of_life(array)

    return array if array == $old_Array
    $old_Array = array 
    $new_Array = Array.new

    index_v = 0
    while index_v < array.length do

        str_row = String.new

        index_h = 0
        while index_h < array[index_v].length do

            (str_row += '.';index_h += 1;next) if array[index_v][index_h] == '.'

            occupied = 0
            
            #top left
            occupied += 1 if index_h != 0 && index_v != 0 && array[index_v - 1][index_h - 1] == 'L'
            
            #top
            occupied += 1 if index_v != 0 && array[index_v - 1][index_h] == 'L'

            #top right
            occupied += 1 if index_v != 0 && index_h != array[index_v].length - 1 && array[index_v - 1][index_h + 1] == 'L'

            #left
            occupied += 1 if index_h != 0 && array[index_v][index_h - 1] == 'L'

            #bottom left
            occupied += 1 if index_h != 0 && index_v != array.length - 1 && array[index_v + 1][index_h - 1] == 'L'

            #bottom
            occupied += 1 if index_v != array.length - 1 && array[index_v + 1][index_h] && array[index_v + 1][index_h] == 'L'

            #bottom right
            occupied += 1 if index_h != array[index_v].length - 1 && index_v != array.length - 1 && array[index_v + 1][index_h + 1] == 'L'

            #right
            occupied += 1 if index_h != array[index_v].length - 1 && array[index_v][index_h + 1] == 'L'

            #sub if no seats
            if occupied == 0 && array[index_v][index_h] == '#'
                str_row += 'L'
            elsif occupied >= 4 && array[index_v][index_h] == 'L'
                str_row += '#'
            else 
                str_row += array[index_v][index_h] 
            end


            index_h += 1
        end

        $new_Array.push(str_row)
        index_v += 1
    end

    Game_of_life($new_Array)
end

puts Game_of_life(array).join.count('L')