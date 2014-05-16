import math
import numpy
from collections import namedtuple
import random




def inverse_against_total(db_array):
    total = 0
    for i in db_array:
        total += i.size
    return [total-x.size for x in db_array]

def inverse_against_largest(db_array):
    max_size = 0
    for i in db_array:
        if i.size > max_size:
            max_size = i.size
    speed_factor = 2 # >1, closer to 1, the faster dbs equalize
    return [(max_size*speed_factor)-x.size for x in db_array]

def weighted_by_size(sizes):
    DB = namedtuple('DB', ['name', 'size'])
    db_array = [DB(name=key, size=val) for key,val in sizes.items()]
    inverse = inverse_against_largest(db_array)
    probability = [float(x)/sum(inverse) for x in inverse]
    max_weight = 30
    weights = [int(math.ceil(x*max_weight)) for x in probability]
    print "sizes", sizes, "weights:", weights
    choices = []
    for index,weight in enumerate(weights):
        for i in range(weight):
            choices.append(db_array[index].name)


def weighted_choice_sub(weights):
    # neat: http://eli.thegreenplace.net/2010/01/22/weighted-random-generation-in-python/
    rnd = random.random() * sum(weights)
    for i, w in enumerate(weights):
        rnd -= w
        if rnd < 0:
            return i

def main():
    DB = namedtuple('DB', ['name', 'size'])
    db_array = [DB(name='a', size=1), DB(name='b', size=8), DB(name='c', size=1)]
    total = sum([x.size for x in db_array])
    inverse_proportion = [total-x.size for x in db_array]
    total = sum(inverse_proportion)
    probability_by_size = [float(x)/total for x in inverse_proportion]
    print db_array
    print "Probabilities:", probability_by_size
    
    for i in range(50):
        index = numpy.random.choice(len(db_array), p=probability_by_size)
        print db_array[index].name,
    print "\n"*3

    sizes = {'a': 1, 'b': 1, 'c': 8}
    weighted_by_size(sizes)

    sizes = {'a': 8000, 'b': 9000, 'c': 10000}
    weighted_by_size(sizes)

    sizes = {'a': 9900, 'b': 9950, 'c': 10000}
    weighted_by_size(sizes)
    
    
    dbs = [DB(name=k, size=v) for k,v in sizes.items()]
    biggest_size = max((db.size for db in dbs))
    factor = 1.1 # must be >1, the close to 1 the faster the dbs equalize
    weights = [biggest_size*factor - db.size for db in dbs]
    selection = weighted_choice_sub(weights)
    db = dbs[selection].name
