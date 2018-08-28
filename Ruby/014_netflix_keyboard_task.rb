######################################################################
# this file contains function to go through and click any sequence of
# characters on remote control keyboard using following actions:
# 'up', 'down', 'left', 'right', 'select'
# Note - input text may only contain capitalized alphabetical
# characters and spaces
######################################################################

def navigate_and_click(sequence)
  keyboard = [%w[A B C D], %w[E F G H], %w[I J K L], %w[M N O P], %w[Q R S T],
              %w[U V W X], ['Y', 'Z', ' ', '#']]
  char_arr = sequence.split('')

  char_coord = []
  char_arr.each do |elem|
    for j in 0..(keyboard.length - 1)
      # for i in 0..3
      0..3.each do |i|
        if keyboard[j][i] == elem
          char_coord << [i, j]
        end
        # keyboard[j][i] == elem ? char_coord << [i, j] : "do nothing"
      end
    end
  end

  current_x_index = 0
  current_y_index = 0
  char_coord.each do |elem|
    next_x = elem[0]
    next_y = elem[1]
    x_diff = next_x - current_x_index
    y_diff = next_y - current_y_index
    if x_diff < 0
      x_diff.abs.times { puts 'Left' }
    elsif x_diff > 0
      x_diff.times { puts 'Right' }
    else
      puts 'Do nothing'
    end
    if y_diff < 0
      y_diff.abs.times { puts 'Up' }
    elsif y_diff > 0
      y_diff.times { puts 'Down' }
    else
      puts 'Do nothing'
    end
    puts 'Select'
    current_x_index = next_x
    current_y_index = next_y
  end

end

string = 'PLHC'
navigate_and_click(string)