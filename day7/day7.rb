arr = File.open("day7.txt", "r").map(&:chomp)

ax = Hash.new

arr.each{|x| x.gsub! " bags " ,',';x.gsub! "contain ","";temp = x.split(','); ax[temp[0]] = temp[1..]}

colors = Array.new
colors.push("shiny gold")
length = 0

until length == colors.length
    length = colors.length
    ax.each do |x,y|
        y.each{|z| z.gsub! "bags","";z.gsub! "bag", "";z.gsub! ".","";z.gsub! /\d+/ ,"";z.strip!}

        colors.each{|z| colors.push(x) if y.include? z}
        colors = colors.uniq    
    end
end

puts "Part 1: #{colors.uniq.length - 1}" #to not count "shiny gold"
