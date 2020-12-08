@path = File.open("day3PATH.txt").map(&:chomp)

def collisions(h_gap,v_gap)
    h,v, tree_count = 0,0,0
    until v == @path.length - 1 do
        tree_count += 1 if @path[v][h% @path[v].length] == "#"
        h += h_gap
        v += v_gap
    end 
    tree_count
end
    
puts "Part 2: #{collisions(1,1)*collisions(3,1)*collisions(5,1)*collisions(7,1)*collisions(1,2)}"
