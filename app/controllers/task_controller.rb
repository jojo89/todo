 require_relative '../../config/application' 
 require 'active_record'

if ARGV.any?
  if ARGV[0] == "list"
    p Task.all
  elsif ARGV[0] == "add"
    Task.create(:description => ARGV[1..-1].join(' '))
  elsif ARGV[0] == "delete"
    Task.destroy(ARGV[1])
  elsif ARGV[0] == "complete"
    item = ARGV[1]
    Task.update_attribute(:completeness, true)
  else
    puts "That command doesn't exist!"
  end

end