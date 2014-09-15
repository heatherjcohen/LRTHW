#creates a mapping of state to abbreviation
states = {
    'Oregon' => 'OR',
    'Florida' => 'FL',
    'California' => 'CA',
    'New York' => 'NY',
    'Michigan' => 'MI'
    }
    
    #creates a basic set of states and some cities in them
cities = {
    'CA' => 'San Francisco',
    'MI' => 'Detriot',
    'FL' => 'Jacksonville'
    }
    
#add some more cities
cities['NY'] = 'New York'
cities['OR'] = 'Portland'

    #puts out some cities
    puts '-' * 10
    puts "NY State has: #{cities['NY']}"
    puts "OR State has: #{cities['OR']}"
    
    #puts some states
    puts '-' * 10
    puts "Michigan's abbrev is: #{states['Michigan']}"
    
    #do it by using the state then cities dict
    puts '-' * 10
    puts "Michigan has: #{cities[states['Michigan']]}"
    
    #puts every state abbrev
    puts '-' * 10
    cities.each do |abbrev, city|
    puts "#{abbrev} has the city #{city}"
    end
    
    #now do both at the same time
    puts '-' *10
    states.each do |state, abbrev|
    city = cities[abbrev]
    puts"#{state} is abbreviated #{abbrev} and has city #{city}"
    end
    
    puts '-' * 10
    #by default ruby says "nil" whens omething isn't in there
    state = states['Texas']
    
    if !state
    puts "Sorry, no Texas."
    end
    
    #default values useing || = with the nil result
    city = cities['TX']
    city ||= 'Does Not Exist'
    puts "the city for the state 'TX' is: #{city}"
