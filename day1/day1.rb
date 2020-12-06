arr = File.open("day1.txt", "r").map(&:to_i)
arr.each{|x| (puts x*(2020-x);break) if arr.include?((2020-x))} #part 1
arr.each{|x| arr.each{|y| (puts x*y*(2020-x-y);return) if arr.include?(2020-x-y)}} #part 2
