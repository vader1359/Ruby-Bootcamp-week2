require_relative "item"

def spr
  puts "\n#{"=" * 10}\n\n"
end

#=====================

class List
  attr_accessor :name, :items
  
  def initialize(name, items = [])
    @name = name
    @items = items
  end
  
  def display
    @items.map {|item| item.display}
  end
  
  #=====================
  
  # Test
  # test_list.display
  
  #=====================
  
  
  def sort(sort_mode)
    if sort_mode == "done_last"
      @items.sort_by! {|item| item.status ? 1 : 0}
    elsif sort_mode == "done_first"
      @items.sort_by! {|item| item.status ? 0 : 1}
    end
  end
  
  
  def add(item)
    @items << item
  end
  
  #=====================
  
  # Test
  # test_list.add(Item.new("Go to CS", true))
  
  #=====================
  
  
  def delete(item_index)
    @items.delete_at(item_index)
  end
  
  #=====================
  
  # Test
  # test_list.delete(2)
  
  #=====================
  
  def done
    @items.keep_if {|item| item.status == true}
  end
  
  def undone
    @items.keep_if {|item| item.status == false}
  end
  
  #=====================
  
  # Test
  # puts test_list.done.display
  # puts test_list.undone.display
  
  #=====================
  
end
#==========================================

# Instance for test
# test_list = List.new("test_list", [
# Item.new("test_item1", true),
# Item.new("test_item2")
# ])
# puts "Use the test_item to test methods above"
# puts test_list.display

#==========================================

# test_list.add(Item.new("Go to CS", true))
# puts test_list.display
# spr
# test_list.delete(1)
# puts test_list.display



