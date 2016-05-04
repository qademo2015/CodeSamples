######################################################################
# this file contains function to go through and click any sequence of
# characters on remote control keyboard using following actions:
# 'up', 'down', 'left', 'right', 'select'
# Note - input text may only contain capitalized alphabetical
# characters and spaces
######################################################################

def navigate_and_click(sequence)
  keyboard = [ ['A', 'B', 'C', 'D'], ['E', 'F', 'G', 'H'], ['I', 'J', 'K', 'L'], ['M', 'N', 'O', 'P'], ['Q', 'R', 'S', 'T'], ['U', 'V', 'W', 'X'], ['Y', 'Z', ' ', '#'] ]
  char_arr = sequence.split('')

  char_coord = []
  char_arr.each{ |elem|
    for j in 0..(keyboard.length-1)
      for i in 0..3
        if keyboard[j][i] == elem
          char_coord << [i, j]
        end
      end
    end
  }
  
  current_x_index = 0
  current_y_index = 0
  char_coord.each{ |elem|
    next_x = elem[0]
    next_y = elem[1]
    x_diff = next_x - current_x_index
    y_diff = next_y - current_y_index

    if x_diff < 0
      x_diff.abs.times do
        puts 'Left'
      end
    elsif x_diff > 0
      x_diff.times do
        puts 'Right'
      end
    else
      puts 'Do nothing'
    end

    if y_diff < 0
      y_diff.abs.times do
        puts 'Up'
      end
    elsif y_diff > 0
      y_diff.times do
        puts 'Down'
      end
    else
      puts 'Do nothing'
    end

    puts 'Select'

    current_x_index = next_x
    current_y_index = next_y

  }

end

string = 'PLHC'
navigate_and_click(string)