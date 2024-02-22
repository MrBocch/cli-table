# cli-table

Present 2 dimensional arrays into a table

## How to use

```
require './table'

t = Table.new ["Student", "Math", "Science", "English"]

t.data = [
    ["John", 85, 90, 88],
    ["Sarah", 78, 85, 92],
    ["David", 91, 88, 85],
    ["George", 99, 99, 99]
]

t.printTable
```

All rows must be of the same size. 