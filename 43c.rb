#Default Scene 
class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end
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

    # be sure to print out the last scene
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
    puts "1) Explore 2)Go back to sleep? Type: 'explore' or 'sleep' "
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
        
    elseif action == 'box'
        puts "The lock buzzes one last time and then you hear a sickening"
        puts "melting sound as the mechanism is fused together."
        puts "You decide to sit there, and finally the Gothons blow up the"
        puts "ship from their ship and you die."
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
   

    action = $stdin.gets.chomp

    if action == 'sleep'
    return 'sleep'
      

    elsif action == 'destroy'
   
      return 'escape_pod'
    else
      puts "DOES NOT COMPUTE!"
      return "the_bridge"
    end
  end
end


class EscapePod < Scene

  def enter()


    good_pod = rand(1..5)
    print "[pod #]> "
    guess = $stdin.gets.chomp.to_i

    if guess != good_pod
    
      return 'sleep'
    else
    


      return 'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job. Your human rubs your belly distractedly while watching TV."
    puts "You lick their fingers and purr. Awwww " 
  end
end

#List of Scenes
class Map
  @@scenes = {
    'start_scene' => StartScene.new(),
    'explore' => Explore.new(),
    'box' => TheBox.new(),
    'posh_toy' => PoshToy.new(),
    'human' => Human.new(),
    'sleep' => Sleep.new(),
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
