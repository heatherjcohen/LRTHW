#Default Scene 
class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
    
  end
  #Attempted to write a global sleep response but it messes up the functionality of the enter thing.
  # Can classes inherit modules? How can I prevent repeating if sleep, sleep? Ask Justin. 
end


#Game Engine
class Engine
=begin When we call a new one, it'll start with an already created map that has a start place 
=end
  def initialize(scene_map)
    @scene_map = scene_map
  end
    #Open at whatever you've already decided the opening scene is
  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')
=begin Why do we need to define the last scene when each scenario says return?
Because what follows is a check. While you're alive, play, when you die and or move to a new room
=end

    while current_scene != last_scene
        #While this current scenario isn't having died somehow
      next_scene_name = current_scene.enter()
      #Run the room you're in
      current_scene = @scene_map.next_scene(next_scene_name)
      #While each scenario says what scene it returns, it still needs to configure before we can go there? 
    end

    # be sure to print out the last scene/make the functional aspect of each room go
    current_scene.enter()
  end
end

class Sleep < Scene
#End scenario
  @@quips = [
    "You go back to sleep and nothing interesting ever happens to you again.",
     "You fall asleep in the nearest sunny patch and are soon stepped on un an unsuspecting giant. You hiss and run off to nap another day.",
     "You find your human and fall asleep on it's warm buzzy electronics. No reddit for you, human.",
     "Why did you even play if you just wanna nap?"
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class StartScene < Scene
#this is where we start
  def enter()
	puts "You are a cat. The world is your sunny patch. You have a human you ruthlessly exploit for sustainance. It is easily controlled by belly rubs. "
    puts "You wake up one fine afternoon full of energy. What do you want to do?"
    puts "'explore' or 'sleep' "
    print "> "

    action = $stdin.gets.chomp

    if action == "sleep"
      return 'sleep'



    elsif action == "explore"
      puts 
      return 'explore'

    else
      puts "DOES NOT COMPUTE!"
      return 'start_scene'
    end
  end
end

class Explore < Scene

  def enter()
    puts "You look about your domain with the serene indifference of royalty."
    puts "You survey your lands and see that there are two new things on the horizon."
    puts "Near the window, there's a posh new cat tree. You vaguely remember your human spending hours put it together."
    puts "Next to it, the box the posh new toy came in." 
    puts "The box looks like a nice cool place for  a nap but, from the cat tree, you can spy on the neighbor cats."
    puts "What's your druthers? 'cat tree' or 'box'? " 
    print ">"
   
    
    action = $stdin.gets.chomp
  

    if action == 'cat tree'
       
        return 'posh_toy'
        
    elsif action == 'box'
        return 'box'
        
    elsif action == 'sleep'
    return 'sleep'
        
    else
      puts "DOES NOT COMPUTE!"
      return 'explore'
    end
  end
end


class PoshToy < Scene

  def enter()
   		puts "You climb the cat tree, taking time to rub yourself onto each and every texture."
        puts "It will smell like you, goddamnit."
        puts "You perch atop the highest level, lord of the land, master of the living room."
        puts "You look out the window and see the neighbor cat, the fiendish outside cat, strutting around."
        puts "You hiss in his general direction, groom your paw, and pause to consider."
        puts "Do you sleep in as convoluted a position on this perch as possible or try to destroy it. You know you want to."
        puts "What do you do? 'sleep' or 'destroy' ?"
         print "> "
   

    action = $stdin.gets.chomp

    if action == 'sleep'
    return 'sleep'
      

    elsif action == 'destroy'
   
      return 'destroy'
    else
      puts "DOES NOT COMPUTE!"
      return 'PoshToy'
    end
  end
end


class Box < Scene

  def enter()
   		puts "You amble over to the box, pausing to watch some dust motes dance in the draft."
        puts "You imagine you can hear a tiny voice come off the mote of dust."
        puts "It calls out to you for help against a terrible fate."
        puts "You sit down in the box and ponder how many civilizations on dust motes you've probably eaten."
        puts "Contented by your capacity to devour worlds, you decide this calls for a celebration"
        puts "What do you do? 'destroy' the box and show it who is boss or 'sleep' the sleep of champions?"
         print "> "
   

    action = $stdin.gets.chomp

    if action == 'sleep'
    return 'sleep'
      

    elsif action == 'destroy'
   
      return 'destroy'
    else
      puts "DOES NOT COMPUTE!"
      return 'box'
    end
  end
end



class Destroy < Scene
def enter()
puts "Putting your feline cleverness to work, you rip it to shreds."
puts "A bit of fluff gets caught around your tail and you chase it about the wreckage."
puts "Bits debris cover your domain, just as you'd always planned"
puts "Contented with your contribution to entropy, you curl up in a sunny patch."
puts "A few hours later, your human comes home. Distraught by your creativity, your human makes upset noises."
puts "You're tempted to run away from the mad human but you know you can charm your way out of this if you try."
puts "Do you 'flop' onto your back and show your belly, doubling down and demanding love "
puts "Or are you a cowardly kitty and 'run away' ?" 
puts "Remember, there's no shame in fleeing O.o"
 print "> "
action = $stdin.gets.chomp

    if action == 'run away'
    return 'run away'
      

    elsif action == 'flop'
   
      return 'human'
    else
      puts "DOES NOT COMPUTE!"
      return 'destroy'
    end
  end
  end
  

class Human < Scene
def enter()
puts "Your human goes 'awwwwwww silly cat, I can't stay mad at you' "
puts "Your purr contentedly with the effectiveness of your manipulation"
return 'finished'
end
end 


class RunAway < Scene
def enter()
puts "You flee! With your tail high in the air, you bolt for the nearest confined space."
puts "You lodge yourself under the furthest corner of the bed and sulk."
puts "Damn human couldn't appreciate your beautiful ability to destroy."
puts "You'll teach 'em"
print ""
puts "You'll teach them alllll." 
puts "Do you ruminate on your 'revenge' or take a nice 'sleep' under the bed and forget about the whole thing?" 
 print "> "
action = $stdin.gets.chomp

    if action == 'sleep'
    return 'sleep'
    

    elsif action == 'revenge'
   
      return 'revenge'
    else
      puts "DOES NOT COMPUTE!"
      return 'destroy'
    end
  end
  end
  
class Revenge < Scene
	def enter()
	puts "You think long and hard about all the things your human loves (that aren't you)."
	puts "You pee on them all."
	puts "You human decides to give you away and become a nomad."
	puts "What did you expect? You ruined everything they love." 
	puts "Your human gives you to an elderly neighbor who never leaves the house."
	puts "You bask in the endless love of a bored mild invalid and nap out the rest of your days." 
	exit(1)
	end
end

class Finished < Scene
  def enter()
    puts "You won in as much as is possible for a cat! It isn't like anyone loses at being a cat. Except humans. They aren't cats."
    puts "=>.<="
    puts "Good job. Your human rubs your belly distractedly while watching TV."
    puts "You lick their fingers (mmm salt) and purr. Awwww " 
  end
end


#List of Scenes
class Map
  @@scenes = {
    'start_scene' => StartScene.new(),
    'explore' => Explore.new(),
    'box' => Box.new(),
    'posh_toy' => PoshToy.new(),
    'human' => Human.new(),
    'sleep' => Sleep.new(),
    'destroy' => Destroy.new(),
    'revenge' => Revenge.new(),
    'run away' => RunAway.new(),
    'finished' => Finished.new(),
  }

#Initialize is special and happens whenever you make a new one
  def initialize(start_scene)
    @start_scene = start_scene
  end

#
  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

#Calls a new map into creation that starts with nap
a_map = Map.new('start_scene')
#this game will refer to the map we just created 
a_game = Engine.new(a_map)
#calls current scene description up. While you still in that room, 
a_game.play()
