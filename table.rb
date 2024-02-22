
class Table
  attr_accessor :header, :data
  # should add checks
  # so taht every row is of the same size 

  def initialize header 
    @header = header
  end

  def printTable
    # i should probably check for things 
    #if @data.empty?
    #  raise "Where is the data?"§
    #end
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

    top = corner[:tr]
    mid = tsign[:rt]
    bot = corner[:bl]

    head = "#{wall}"
    (0...sdata[0].length).each do |i|
      temp = " #{sdata[0][i].ljust(rpad[i])}#{wall}"
      top += temp.split("").map{|s| floor}.join("")
      top[-1] = tsign[:dt]

      mid += temp.split("").map{|s| floor}.join("")
      mid[-1] = tsign[:cross]

      bot += temp.split("").map{|s| floor}.join("")
      bot[-1] = tsign[:ut]
      head << temp
    end
    top[-1] = corner[:tl]
    mid[-1] = tsign[:lt]
    bot[-1] = corner[:br]

    puts top 
    puts head
    puts mid
    # we can start printing table 
    sdata[1..-1].each do |l|
      (0...l.length()).each do |i|
        print("#{wall} #{l[i].ljust(rpad[i])}")
      end
      print "#{wall}"
      puts ""
    end

    puts bot 
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