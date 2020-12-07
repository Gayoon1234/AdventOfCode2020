arr = File.open("day7.txt", "r").map(&:chomp)
$ax = Hash.new
arr.each{|x| x.gsub! " bags " ,',';x.gsub! "contain ","";temp = x.split(','); $ax[temp[0]] = temp[1..]}


$ax.each do |x,y|
    y.each{|z| z.gsub! "bags","";z.gsub! "bag", "";z.gsub! ".","";z.strip!}
end

$counter = 0
def findColor(colors)
    $counter +=1
    colors.each{|c| c[0].to_i.times{findColor($ax[c[2..].to_s])} if c != "no other"}
end

findColor($ax["shiny gold"])
puts"Part 2: #{$counter - 1}"
