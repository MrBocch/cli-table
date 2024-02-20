
class Table
  attr_accessor :header, :data
  # should add checks
  # so taht every row is of the same size 

  def initialize header 
    @header = header
  end

  def printTable
    # i should probably check for things 
    if @data.empty?
      raise "Where is the data?"
    end
    sdata = [@header.clone]
    sdata += self.datato_s
    # does everything have to be turned into a string?
    # i think so 

    # get longest item in a column
    rpad = []
    nrows = sdata[0].length
    # the issue was, i was going for how many rows, should of gone by rows
    # this is really confussing
    # idk why it really works 
    0.upto(nrows -1).each do |i|
      #p sdata[i]
      rpad << sdata.max{|a, b| a[i].length <=> b[i].length}[i].length() +1
    end
 
    floor = '─'
    wall = '│' 
    tsign  = {:ut => '┴', :dt => '┬', :rt => '├', :lt => '┤', :cross => '┼'}
    corner = {:tr => '┌', :tl => '┐', :br => '┘', :bl => '└'}

    # how do print lower and top part of table?
    # ┌────┬──────┬───┐
    # |data| data | x | 
    # ├────┼──────┼───┤

    # we can start printing table 
    sdata.each do |l|
      (0...l.length()).each do |i|
        print("#{wall} #{l[i].ljust(rpad[i])}")
      end
      print "#{wall}"
      puts ""
    end
 
  end

  # is this a bad idea
  # if there is alot of data?
  private
  def datato_s
    stringify = []
    @data.each do |row|
      stringify << row.map {|e| e.to_s}
    end
    stringify
  end
end


# this monstrosity
# is the code for making table
def stats()
  # rows = [[data], [data], [data]]

  # here we convert 
  # everything into a 
  # string, for convinience?


  # if they were not strings we could not check for this
  # we get the longest membe rin column, for padding porpuses
  # we want to pad up shorter strings

  id = "id".ljust(rpad_id, " ")
  activity = "Activity".ljust(rpad_act, " ")
  time = "Time".ljust(rpad_time, " ")
 
  floor = '─'
  wall = '│' 

  id_col = "#{wall} #{id} #{wall}"
  activity_col = "#{activity} #{wall}"
  time_col = "#{time} #{wall}"

  tsign  = {:ut => '┴', :dt => '┬', :rt => '├', :lt => '┤', :cross => '┼'}
  corner = {:tr => '┌', :tl => '┐', :br => '┘', :bl => '└'}
  # this must be the worst code i have ever written in my life
  # sorrow to those that lay their eyes upon it
  uheader = (id_col).split("").map{|c| floor}.join("")
  uheader[0] = corner[:tr]
  uheader[-1] = corner[:tl]

  uheader += (activity_col).split("").map{|c| floor}.join("")
  uheader[id_col.length-1] = tsign[:dt]
  uheader += tsign[:dt]

  uheader += (time_col).split("").map{|c| floor}.join("")
  uheader += corner[:tl]

  dheader = (id_col).split("").map{|c| floor}.join("")
  dheader[0] = tsign[:rt]
  dheader[-1] = tsign[:cross]

  dheader += (activity_col).split("").map{|c| floor}.join("")
  dheader += tsign[:cross]
  
  dheader += (time_col).split("").map{|c| floor}.join("")
  dheader += tsign[:lt]

  endtable = (id_col).split("").map{|c| floor}.join("")
  endtable[0] = corner[:bl]
  endtable[-1] = tsign[:ut]

  endtable += (activity_col).split("").map{|c| floor}.join("")
  endtable += tsign[:ut]

  endtable += (time_col).split("").map{|c| floor}.join("")
  endtable += corner[:br]

  header = "#{id_col} #{activity_col} #{time_col}" 

  # print the top part of table 
  puts uheader 
  puts header
  puts dheader
  # print part of table right below header

  rows.each do |row|
    id = row[0].to_s.ljust(rpad_id, " ")
    act = row[1].ljust(rpad_act, " ") # so cool
    time = row[2].ljust(rpad_time, " ")
    # h, m = secToHM(row[2])

    puts "#{wall} #{id} #{wall} #{act} #{wall} #{time} #{wall}"
  end
  puts endtable

end