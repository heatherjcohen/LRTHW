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
      #**JUSTIN what does line 29 do? This is where I get lost**#
    end

    # be sure to print out the last scene
    current_scene.enter()
  end
end

class Death < Scene

  @@quips = [
    "You died.  Being a cat is hard, yo.",
     "Off to the pet cementary with you",
     "Boooooo. That's what you say now. As a ghost. Yeah.",
     "Witty death banter!"
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class CentralCorridor < Scene

  def enter()

    print "> "

    action = $stdin.gets.chomp

    if action == ""
      return 'death'

    elsif action == ""
      return 'death'

    elsif action == "tell a joke"
      puts 
      return 'laser_weapon_armory'

    else
      puts "DOES NOT COMPUTE!"
      return 'central_corridor'
    end
  end
end

class LaserWeaponArmory < Scene

  def enter()
    puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
   
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 0

    while guess != code && guesses < 10
      puts "BZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end

    if guess == code
        puts "The container clicks open and the seal breaks, letting gas out."
        puts "You grab the neutron bomb and run as fast as you can to the"
        puts "bridge where you must place it in the right spot."
        return 'the_bridge'
    else
        puts "The lock buzzes one last time and then you hear a sickening"
        puts "melting sound as the mechanism is fused together."
        puts "You decide to sit there, and finally the Gothons blow up the"
        puts "ship from their ship and you die."
        return 'death'
    end
  end
end


class TheBridge < Scene

  def enter()
   

    action = $stdin.gets.chomp

    if action == "throw the bomb"
      

    elsif action == "slowly place the bomb"
   
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
    
      return 'death'
    else
    


      return 'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end

#List of Scenes
class Map
  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
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

#Calls a new map into creation that starts are central corridor
a_map = Map.new('central_corridor')
#this game will refer to the map we just created that starts at CC
a_game = Engine.new(a_map)
#calls current scene description up. While you still in that room, 
a_game.play()
