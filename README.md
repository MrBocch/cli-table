# cli-table

Present 2 dimensional arrays into a table

## How to use

```
require 'cli-table'

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

## TODO 

* make into a gem
* add configuribility

## Inspiration

This all came about when I
wanted to print something similar 
to `sqlite .mode box` in this 
[project](https://github.com/MrBocch/Time-Tracker)