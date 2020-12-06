arr = File.open("day1.txt", "r").map(&:to_i)
arr.each{|x| (puts x*(2020-x);break) if arr.include?((2020-x))}
