class Item
  attr_accessor :name, :status
  
  #=====================
  
  # Test:
  # p test_item.name
  # p test_item.status
  
  #=====================
  
  def initialize(name, status = false)
    @name = name
    @status = status
  end
  #=====================
  
  def self.new_from_line(line)
    name = line[6..-1]
    if line[3] == "x"
      status = true
    else
      status = false
    end
    Item.new(name, status)
  end
  
  #=====================
  
  # Test
  # Item.new_from_line("- [ ] Have breakfast")
  
  #=====================
  
  def mark_done
    @status = true
  end
  
  def mark_undone
    @status = false
  end
  
  #=====================
  
  # Test
  # test_item.mark_done.display
  # test_item.mark_undone.display
  
  #=====================
  
  
  def undo
    if @status == false
      @status = true
    elsif @status == true
      @status = false
    end
  end

  
  def display
    if @status == true
      "- [x] #{@name}"
    else
      "- [ ] #{@name}"
    end
  end
  
end


# Test

#==========================================

# Instance for test
# test_item = Item.new("Go to CS", true)
# puts "Use the test_item to test methods above"
# puts test_item.display

#==========================================




