def printList(x):
    for i in x:
        print(i)

def swapListEl(in_list, i, j):
    temp = in_list[i]
    in_list[i] = in_list[j]
    in_list[j] = temp


class Combinatorics:
    output_l = []
    output_l2 = []

    def permutations(self, input_l, t_size):

        if t_size == 1:
            if input_l not in self.output_l:
                self.output_l.append(list(input_l))
        else:
            for i in range(0, t_size):
                self.permutations(self, input_l, t_size - 1)

                if t_size % 2:
                    swapListEl(input_l, 0, t_size - 1)
                else:
                    swapListEl(input_l, i, t_size - 1)

    def combinations(self, k, n, input_l, end=None, start=0, build_l=[]):
        if not end:
            end = n
        if len(build_l) == k:
            if build_l not in self.output_l2:
                self.output_l2.append(list(build_l))

        else:
            for i in range(start, end):
                build_l.append(input_l[i])
                self.combinations(self, k, n, input_l, n, i + 1, build_l)
                build_l.pop()

    def nonRepetitionVariations(self, k, n, input_l):
        self.permutations(self, input_l, n)
        for i in self.output_l:
            self.combinations(self, k, n, i)

    def repetitionVariations(self, k, input_l, build_l=[], start=0):
        n = len(input_l)
        if k==0:
         #  print(build_l)
           self.output_l.append(list(build_l))

        else:
            for i in range(start, n):
                build_l.append(input_l[i])
                self.repetitionVariations(self, k-1, input_l, build_l, start)
        if build_l:
            build_l.pop()

    def cleanOutput(self):
        self.output_l = []
        self.output_l2 = []

    def getPermutations(self, input_l, t_size):
        self.cleanOutput(self)
        self.permutations(self, input_l, t_size)
        return self.output_l

    def getCombinations(self, k, n, input_l):
        self.cleanOutput(self)
        self.combinations(self, k, n, input_l)
        return self.output_l2

    def getNonRepVariations(self, k, n, input_l):
        self.cleanOutput(self)
        self.nonRepetitionVariations(self, k, n, input_l)
        return self.output_l2

    def getRepVariations(self, k, input_l):
        self.cleanOutput(self)
        self.repetitionVariations(self, k, input_l)
        return self.output_l


if __name__ == '__main__':
    inl = ['1', '2', '3']
    test = Combinatorics

    x = test.getPermutations(test, inl, len(inl))
    print("Permutations: \n")
    printList(x)

    print('\n')

    y = test.getCombinations(test, 2, 3, inl)
    print("Combinations: \n")
    printList(y)

    print('\n')

    z = test.getNonRepVariations(test, 2, 3, inl)
    print("Non-Rep Variations: \n")
    printList(z)

    print('\n')

    print("Rep Variations: \n")
    f = test.getRepVariations(test,4,inl)
    printList(f)
