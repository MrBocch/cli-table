
class Table
  attr_accessor :header, :rows

  def initialize header
    @header = header
    @rows = []
  end

  def show

    # wish i could explain what line of code its wrong
    if not is_correct then return end

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

  def is_correct?

    if @header == []
      return false
    end

    if @rows == []
      return true
    end

    t = @rows.map {|l| l.length}.uniq
    if t.length != 1
      return false
    end

    if t[0] != @header.length
      return false
    end

    return true
  end

  # is this a bad idea
  # if there is alot of data?
  private
  def datato_s
    stringify = []
    if not rows.empty?
      @rows.each do |row|
        stringify << row.map {|e| e.to_s}
      end
    end

    stringify
  end

  private
  def explain_error why
    puts "\n  [cli-table]: #{why}"
  end

  private
  def is_correct

    if @header == []
      explain_error "Empty header"
      puts caller[1..2]
      return false
    end

    if @rows == []
      return true
    end

    t = @rows.map {|l| l.length}.uniq
    if t.length != 1
      explain_error "Cant print table because rows are different size"
      puts caller[1..2]
      return false
    end

    if t[0] != @header.length
      explain_error "Cant print because rows size is different from header size"
      puts caller[1..2]
      return false
    end

    return true
  end
end
