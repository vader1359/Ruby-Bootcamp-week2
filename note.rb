require_relative "item"
require_relative "list"
require_relative "todo"

Item
  Item.new_from_line(line) -> Item
  .display -> String | Void
  .mark_done -> bool | Set
  .mark_undone -> bool | Set
  
List
  .display -> array | Void
  .add -> array | Set
  .delete -> array | Set

Todo
  .load_data -> array of Item | Void
  .show_all -> array of Item | Void
  .show_done -> array of Item | Void
  .show_undone -> Array of Item | Void
  .display -> Array of String | Void
  .delete -> Array of Item | Set
  .add -> Array of Item | Set
