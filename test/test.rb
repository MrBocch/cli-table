require_relative "../lib/cli-table.rb"

def test1
  a = Table.new(["", "Math", "Science", "History"])

  a.rows = [
      ["Jorge", "80", "78", "94"],
      ["Bella", "60", "80", "70"],
      ["John", "100", "100", "100"]
  ]

  a.show
end

def test2
  a = Table.new(["", "Math", "Science", "History"])

  a.rows = [
      ["Jorge", 80, 78, 94],
      ["Bella", 60, 80, 70],
      ["John", 100, 100, 100]
  ]

  a.show
end

def test3
  a = Table.new(["", "Math", "Science", "History"])
  p a.rows
  a.show
end

# why does this one does work?, a += [...], this not work bc you have to append a list to a list
def test4
  a = Table.new(["", "Math", "Science", "History"])
  a.rows << ["jhonny", 80, 80, 80]

  a.show
end

puts "Test 1 (Table with all strings)"
test1

puts "Test 2 (Table with rows that is not string)"
test2

puts "Test 3 (Table with no rows)"
test3

puts "Test 4 (Append to rows)"
test4
