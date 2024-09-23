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
  a.show
end

# why does this one does work?, a += [...], this not work bc you have to append a list to a list
def test4
  a = Table.new(["", "Math", "Science", "History"])
  a.rows << ["jhonny", 80, 80, 80]

  a.show
end

def test5
  # raise error, that explains rows are different sizes
  a = Table.new(["", "Math", "Science", "History"])
  a.rows << ["jhonny", 1, 2, 3]
  a.rows << ["poop", 1, 2]

  a.show
end

def test6
  # raise error, that explains that its wrong size
  a = Table.new(["", "Math", "Science", "History"])
  a.rows << ["jhonny"]
  a.rows << ["poopy"]

  a.show
end

def test7
  # is row correct
  a = Table.new(["", "Math", "Science", "History"])
  a.rows << ["jhonny", 1, 2, 3]

  p a.is_correct?
end

def test8
  # raise error, that explains that its wrong size
  a = Table.new(["", "Math", "Science", "History"])
  a.rows << ["jhonny"]
  a.rows << ["poopy"]

  p a.is_correct?
end

def test9
  # what if no header?
  a = Table.new

  a.show
end

def test10
  # what if empty header?
  a = Table.new []

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

puts "Test 5 (Different size rows)"
test5

puts "Test 6 (Rows not equal to Header size)"
test6

puts "Test 7 (Calling is_correct? method, when correct)"
test7

puts "Test 8 (Calling is_correct? method, when incorrect)"
test8

puts "Test 9 (What if no header)"
# test9  #get initialize error: wrong number of arguments, i think i will leave as is

puts "Test 10 (What if empty header)"
test10 #when first called it, it return
# "┐"
# "│"
# "┤"
# "┘"
# why did it print this?, funny
