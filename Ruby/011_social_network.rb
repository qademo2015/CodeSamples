######################################################################
# this file contains basic implementation of social network
# functionality
######################################################################

class People

  attr_accessor :people

  def initialize
    @people = {}
  end

  def add_direct_friend(person_1, person_2)
    if not @people[person_1][:direct_friends].include?(person_2)
      @people[person_1][:direct_friends] << person_2
    end
  end

  def delete_direct_friend(person_1, person_2)
    if @people[person_1][:direct_friends].include?(person_2)
      @people[person_1][:direct_friends].delete(person_2)
    end
  end

  def add_indirect_friend(person_1, person_2)
    if !@people[person_1][:indirect_friends].include?(person_2) && person_1 != person_2
      @people[person_1][:indirect_friends] << person_2
    end
  end

  def delete_indirect_friend(person_1, person_2)
    if @people[person_1][:indirect_friends].include?(person_2) && person_1 != person_2
      @people[person_1][:indirect_friends].delete(person_2)
      @people[person_2][:indirect_friends].delete(person_1)
    end
  end

  def make_friend(person_1, person_2)
    arr = [person_1, person_2]

    # block of adding one person/multiple people into the network
    arr.each do |person|
      if not @people.keys.include?(person)
        @people[person] = { :direct_friends => [], :indirect_friends => [] }
      end
    end

    # block of adding direct friends (should go before adding indirect friends)
    add_direct_friend(arr[0], arr[1])
    add_direct_friend(arr[1], arr[0])

    # block of adding indirect friends (should go after adding direct friends)
    @people.keys.each do |person|
      @people[person][:direct_friends].each do |direct_friend|
        @people[direct_friend][:direct_friends].each do |sub_dir_friend|
          add_indirect_friend(person, sub_dir_friend)
        end
      end
    end

  end

  def unfriend(person_1, person_2)
    arr = [person_1, person_2]

    # block of removing indirect friends (should go before removing direct friends)
    arr.each do |person|
      if @people.keys.include?(person)
        @people[person][:direct_friends].each do |direct_friend|
          @people[direct_friend][:direct_friends].each do |sub_dir_friend|
            delete_indirect_friend(person, sub_dir_friend)
          end
        end
      end
    end

    # block of removing direct friends (should go after removing indirect friends)
    if @people.keys.include?(arr[0]) && @people.keys.include?(arr[1])
      delete_direct_friend(arr[0], arr[1])
      delete_direct_friend(arr[1], arr[0])
    end

  end

  def direct_friends(person)
    if @people.keys.include?(person)
      @people[person][:direct_friends]
    end
  end

  def indirect_friends(person)
    if @people.keys.include?(person)
      @people[person][:indirect_friends]
    end
  end

end # end of class People

network = People.new
network.make_friend('Alexey', 'Igor')
network.make_friend('Igor', 'Andrey')
network.make_friend('Igor', 'Efim')
puts network.people
puts ''
puts network.direct_friends('Igor')
puts ''
puts network.direct_friends('Alexey')
puts ''
puts network.indirect_friends('Alexey')
network.unfriend('Alexey', 'Igor')
puts network.people
puts ''
network.make_friend('Alexey', 'Igor')
puts ''
puts network.people
