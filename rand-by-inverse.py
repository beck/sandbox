import numpy
from collections import namedtuple


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

if __name__ == "__main__":
    main()
