 require_relative '../../config/application' 
 require 'active_record'

if ARGV.any?
  if ARGV[0] == "list"
    Task.all.each do |t|
      print "#{t.id}. #{t.description}\n"
    end
  elsif ARGV[0] == "add"
    task_new = Task.create(:description => ARGV[1..-1].join(' '))
    print "Appended '#{task_new.description}' to your TODO list...\n"
  elsif ARGV[0] == "delete"
    deleted_task = Task.find(ARGV[1])
    Task.destroy(deleted_task)
    print "Deleted '#{deleted_task.description}' from your TODO list...\n"
  elsif ARGV[0] == "complete"
    completed_task = Task.find(ARGV[1])
    Task.update(completed_task, :completeness => true)
    print "Completed '#{completed_task.description}' on your TODO list...\n"
  else
    puts "That command doesn't exist!"
  end

end