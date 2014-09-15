i = 0
numbers = []

while i < 6
    puts "At the top i is #{i}"
    numbers.push(i)
    
    i +=1
    puts "Numbers now: ", numbers
    puts "At the bottom i is #{i}"
end

puts "The numbers: "

#remember you can write this 2 other ways?

numbers.each{|num| puts num}

#restate
elements = []

(0..5).each do |i|
    puts "adding #{i} to the list."
    #pushes the i variable on the END of the list
    elements.push(i)
end
