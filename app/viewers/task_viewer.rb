 require_relative '../../config/application'
 require 'active_record'

def listed_message(item)
  print "#{item.id}. #{item.description}\n"
end

def added_message(item)
  print "Appended '#{item.description}' to your TODO list...\n"
end

def deleted_message(item)
  print "Deleted '#{item.description}' from your TODO list...\n"
end

def completed_message(item)
  print "Completed '#{completed_task.description}' on your TODO list...\n"
end

def no_command_message
  puts "That command doesn't exist!"
end