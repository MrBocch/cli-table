require './table'
# how do i make a gem?

t = Table.new ["Student", "Math", "Science", "English"]

t.data = [
    ["John", 85, 90, 88],
    ["Sarah", 78, 85, 92],
    ["David", 91, 88, 85],
    ["George", 99, 99, 99]
]

#p #t.print
t.printTable
