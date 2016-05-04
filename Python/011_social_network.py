######################################################################
# this file contains basic implementation of social network
# functionality
######################################################################


class People(object):
    """ Represents a general Social network functionality"""

    def __init__(self):
        self.people = {}

    def add_direct_friend(self, person1, person2):
        if person2 not in self.people[person1]['direct_friends']:
            self.people[person1]['direct_friends'].append(person2)

    def delete_direct_friend(self, person1, person2):
        if person2 in self.people[person1]['direct_friends']:
            self.people[person1]['direct_friends'].remove(person2)

    def add_indirect_friend(self, person1, person2):
        if (person2 not in self.people[person1]['indirect_friends']) and (person1 != person2):
            self.people[person1]['indirect_friends'].append(person2)

    def delete_indirect_friend(self, person1, person2):
        if (person2 in self.people[person1]['indirect_friends']) and (person1 != person2):
            self.people[person1]['indirect_friends'].remove(person2)
            self.people[person2]['indirect_friends'].remove(person1)

    def make_friend(self, person1, person2):
        arr = [person1, person2]

        # block of adding one person/multiple people into the network
        for person in arr:
            if person not in self.people.keys():
                self.people[person] = {'direct_friends': [], 'indirect_friends': []}

        # block of adding direct friends (should go before adding indirect friends)
        self.add_direct_friend(arr[0], arr[1])
        self.add_direct_friend(arr[1], arr[0])

        # block of adding indirect friends (should go after adding direct friends)
        for person in self.people.keys():
            for direct_friend in self.people[person]['direct_friends']:
                for sub_dir_friend in self.people[direct_friend]['direct_friends']:
                    self.add_indirect_friend(person, sub_dir_friend)

    def unfriend(self, person1, person2):
        arr = [person1, person2]

        # block of removing indirect friends (should go before removing direct friends)
        for person in arr:
            if person in self.people.keys():
                for direct_friend in self.people[person]['direct_friends']:
                    for sub_dir_friend in self.people[direct_friend]['direct_friends']:
                        self.delete_indirect_friend(person, sub_dir_friend)

        # block of removing direct friends (should go after removing indirect friends)
        if self.people.has_key(arr[0]) and self.people.has_key(arr[1]):
            self.delete_direct_friend(arr[0], arr[1])
            self.delete_direct_friend(arr[1], arr[0])

    def direct_friends(self, person):
        if person in self.people.keys():
            return self.people[person]['direct_friends']

    def indirect_friends(self, person):
        if person in self.people.keys():
            return self.people[person]['indirect_friends']


def main():
    network = People()
    network.make_friend('Alexey', 'Igor')
    network.make_friend('Igor', 'Andrey')
    network.make_friend('Igor', 'Efim')
    print(network.people)
    print('')
    print(network.direct_friends('Igor'))
    print('')
    print(network.direct_friends('Alexey'))
    print('')
    print(network.indirect_friends('Alexey'))
    network.unfriend('Alexey', 'Igor')
    print(network.people)
    print('')
    network.make_friend('Alexey', 'Igor')
    print('')
    print(network.people)

if __name__ == '__main__':
    main()