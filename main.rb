require './table'
# how do i make a gem?

t = Table.new ["id", "Activity", "Time"]
t.header = ["h1", "header2", "h3"]
t.data = [(1..3).to_a,
          (4..6).to_a,
          ["hi", "test", "loooong"]
]

#p #t.print
t.print
