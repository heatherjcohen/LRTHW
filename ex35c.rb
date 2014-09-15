def gold_room
  puts "This room is full of gold.  How much do you take?"

  print "> "
  choice = $stdin.gets.chomp

  # this line has a bug, so fix it
  if choice.is_a? () 
    how_much = choice.to_i
  else
    dead("Man, learn to type a number.")
  end
end
