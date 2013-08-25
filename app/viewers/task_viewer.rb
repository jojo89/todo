require_relative '../../config/application'
require 'active_record'

def select_list_message
  puts "\nEnter a list number to begin managing your tasks."
  puts "List management options: \n--add <list name>   --delete <list #>"
end

def selected_list(list_num)
  print "\nYou selected the list '#{List.find(list_num).name}'."
end

def select_task_action(list_num)
  print "\nEnter a task action for '#{List.find(list_num).name}':\n"
  print "--all   --add <task description>   --delete <task #>   --complete <task #>\n"
  print "--back   (returns you to the main menu)\n"
end

def listed_message(item)
  print "#{item.id}. #{item.description}\n"
end

def list_item(list)
  print "#{list.id}. #{list.name}\n"
end

def added_message(item)
  print "Appended '#{item.description}' to your '#{List.find(item.list_id).name}' list...\n"
end

def deleted_message(item)
  print "Deleted '#{item.description}' from your '#{List.find(item.list_id).name}' list...\n"
end

def completed_message(item)
  print "Completed '#{item.description}' on your '#{List.find(item.list_id).name}' list...\n"
end

def no_command_message
  puts "That command doesn't exist!"
end

def new_list_message(item)
  print "Added new todo list '#{item.name}'.\n"
end

def deleted_list_message(item)
  print "Deleted the todo list '#{item.name}'.\n"
end