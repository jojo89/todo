 require_relative '../../config/application'
 require 'active_record'

if ARGV.any?
  if ARGV[0] == "list"
    Task.all.each do |t|
      listed_message(t)
    end
  elsif ARGV[0] == "add"
    task_new = Task.create(:description => ARGV[1..-1].join(' '))
    added_message(task_new)
  elsif ARGV[0] == "delete"
    task_to_delete = Task.find(ARGV[1])
    Task.destroy(task_to_delete)
    deleted_message(task_to_delete)
  elsif ARGV[0] == "complete"
    task_to_complete = Task.find(ARGV[1])
    Task.update(task_to_complete, :completeness => true)
    completed_message(task_to_complete)
  else
    no_command_message
  end

end