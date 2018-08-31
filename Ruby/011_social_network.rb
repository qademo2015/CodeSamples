######################################################################
# this file contains basic implementation of social network
# functionality - friend/unfriend
######################################################################

# this class contains basic logic for social network functionality
class People

  attr_accessor :people

  def initialize
    @people = {} # initialize empty hash to store people
  end

  def add_direct_friend(person1, person2)
    @people[person1][:direct_friends] << person2 unless
        @people[person1][:direct_friends].include?(person2) && person1 == person2
  end

  def delete_direct_friend(person1, person2)
    return unless @people[person1][:direct_friends].include?(person2)
    @people[person1][:direct_friends].delete(person2)
  end

  def add_indirect_friend(person1, person2)
    return unless !@people[person1][:indirect_friends].include?(person2) && person1 != person2
    @people[person1][:indirect_friends] << person2
  end

  def delete_indirect_friend(person1, person2)
    return unless @people[person1][:indirect_friends].include?(person2) && person1 != person2
    @people[person1][:indirect_friends].delete(person2)
    @people[person2][:indirect_friends].delete(person1)
  end

  def make_friend(person1, person2)
    arr = [person1, person2]
    # block of adding one/multiple people into the network
    arr.each do |person|
      @people[person] = { direct_friends: [], indirect_friends: [] } unless
          @people.keys.include?(person)
    end
    # block of adding direct friends
    # (should go before adding indirect friends)
    add_direct_friend(person1, person2)
    add_direct_friend(person2, person1)
    # block of adding indirect friends
    # (should go after adding direct friends)
    @people.keys.each do |person|
      update_indirect_friends(person: person, action: 'add')
    end
  end

  def unfriend(person1, person2)
    arr = [person1, person2]
    # block of removing indirect friends
    # (should go before removing direct friends)
    arr.each do |person|
      next unless @people.keys.include?(person)
      update_indirect_friends(person: person, action: 'delete')
    end
    # block of removing direct friends
    # (should go after removing indirect friends)
    return unless @people.keys.include?(person1) && @people.keys.include?(person2)
    delete_direct_friend(person1, person2)
    delete_direct_friend(person2, person1)
  end

  def update_indirect_friends(person:, action:)
    @people[person][:direct_friends].each do |direct_friend|
      @people[direct_friend][:direct_friends].each do |sub_dir_friend|
        case action
        when 'add'
          add_indirect_friend(person, sub_dir_friend)
        when 'delete'
          delete_indirect_friend(person, sub_dir_friend)
        else
          raise Exception('No such action for indirect friends')
        end
      end
    end
  end

  def direct_friends(person)
    return unless @people.keys.include?(person)
    @people[person][:direct_friends]
  end

  def indirect_friends(person)
    return unless @people.keys.include?(person)
    @people[person][:indirect_friends]
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
