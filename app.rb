require_relative "item"
require_relative "list"
require_relative "todo"

require "Bundler/setup"
Bundler.require

@@list_name = File.read("todo.data").split("\n")[0][11..-1]


get "/" do
  todo = Todo.new("todo.data", @@list_name) # -> Array of all Items
  
  erb :"index.html", layout: :"layout.html", locals: {todo: todo}
end

post "/change_status" do
  todo = Todo.new("todo.data", @@list_name)
  todo.load_data.items[params[:index_changed].to_i].undo
  todo.save_data
  
  redirect to("/")
end

post "/sort" do
  todo = Todo.new("todo.data", @@list_name)
  p params
  todo.load_data.sort(params[:sort_mode])
  todo.save_data
  
  redirect to("/")
end

post "/add_todo" do
  todo = Todo.new("todo.data", @@list_name)
  p params
  todo.load_data
  todo.add(params[:todo_name])
  todo.save_data
  
  redirect to("/")
end

post "/change_list_name" do
  p params
  todo = Todo.new("todo.data", @@list_name)
  todo.load_data
  todo.save_data(nil, params[:list_name])

  redirect to("/")
end