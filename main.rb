require './table'
# how do i make a gem?

t = Table.new ["hello", "world", "idk"]

t.header = ["h1", "header2", "h3"]
t.data = [(1..3).to_a,
          (4..6).to_a,
          ["himuh", "test", "loooong"],
          ["a", "notha", "test"],
          [1,2,400],
          ["hello", "idk", "loooooonger"]
]

#p #t.print
t.print
