location = 0
general = ['quit', 'options']
hall = ['', 'north', 'south', 'look', 'look at floor', 'look at door']
study = ['', 'south', 'look', 'look at desk', 'look at safe', 'y', 'n']
safe = ['', 'stop', '7591']

puts "Type 'options' at any time to see the available commands."
puts "Let the heist begin!"

while true do
  
  command = gets.chomp.downcase

#   General commands (can be run at any time)

  if command == "quit"
    puts "Bye!"
    break
  end
  
  if command == "options"
    if location == 0
      puts "Exit game:     'quit'"
      puts "Travel:        'north', 'south'"
      puts "Look around:   'look'"
      puts "Examine:       'look at xxxx'"
    end
    if location == 1
      puts "Exit game:     'quit'"
      puts "Travel:        'south'"
      puts "Look around:   'look'"
      puts "Examine:       'look at xxxx'"
    end
    if location == 2
      puts "Exit game:       'quit'"
      puts "Stop guessing:   'stop'"
    end
  end

#   Hall
  
  if location == 0 && command == "look" 
    puts "You are standing in an hall with a marble floor. You see a door."
  elsif location == 0 && command == "look at floor" 
    puts "Nothing to see here"
  elsif location == 0 && command == "look at door" 
    puts "It's wide open. What could be ahead?"
  elsif location == 0 && command == "north" 
    puts "Moved into the study."
    location += 1
    command = ""
  elsif location == 0 && command == "south" 
    puts "You can't leave empty handed."
  elsif location == 0 && !(hall+general).include?(command)
    puts "Invalid command"
  end
  
#   Study
  
  if location == 1 && command == "look" 
    puts "You are in a warm and cosy study. You see a safe. You see a desk."
    command = ""
  elsif location == 1 && command == "look at safe"
    puts "A combination safe, it looks very sturdy. Attempt to crack it? 'y'/'n'"
    command = gets.chomp.downcase
    if command == "y"
      puts "You move in closer. Enter combination:"
      location += 1
      command = ""
    end
    if command == "n"
      puts "Your attention draws to the rest of the room."
      command = ""
    end
  elsif location == 1 && command == "look at desk"
    puts "You see a piece of paper that reads, The combination is 7591."
    command = ""
  elsif location == 1 && command == "south"
    puts "Moved into the hall."
    location -= 1
    command = ""
  elsif location == 1 && !(study+general).include?(command)
    puts "Invalid command"
    command = ""
  end

#   The Safe!

  if location == 2 && command == "7591"
    puts "You see some diamonds in the safe. You pick them up and make your escape!"
    break
  elsif location == 2 && command == "stop"
    puts "Your attention draws to the rest of the room."
    location -= 1
    command = ""
  elsif location == 2 && !(safe+general).include?(command)
    puts "The safe doesn't budge"
  end

end