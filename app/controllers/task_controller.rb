 require_relative '../viewers/task_viewer'
 require_relative '../../config/application'
 require 'active_record'

class TodoManager
  def run!
    select_list_message
    List.all.each do |l|
      list_item(l)
    end
    list_action = gets.chomp.split(' ')
    control     = list_action[0].downcase
    argument    = list_action[1..-1].join(' ')
    if control == "add"
      list_new = List.create(name: argument)
      new_list_message(list_new)
      run!
    elsif control == "delete"
      list_to_delete = List.find(argument)
      List.destroy(list_to_delete)
      deleted_list_message(list_to_delete)
      run!
    else
      selected_list(control)
      manage_selected_list(control)
    end
  end

  def manage_selected_list(list_num)
    select_task_action(list_num)
    task_action = gets.chomp.split(' ')
    control     = task_action[0].downcase
    argument    = task_action[1..-1].join(' ')
    if task_action[0] == "all"
      Task.where(list_id: list_num).each do |t|
        listed_message(t)
      end
      manage_selected_list(list_num)
    elsif control == "add"
      task_new = Task.create(list_id: list_num, description: argument)
      added_message(task_new)
      manage_selected_list(list_num)
    elsif control == "delete"
      task_to_delete = Task.find(argument)
      Task.destroy(task_to_delete)
      deleted_message(task_to_delete)
      manage_selected_list(list_num)
    elsif control == "complete"
      task_to_complete = Task.find(argument)
      Task.update(task_to_complete, :completeness => true)
      completed_message(task_to_complete)
      manage_selected_list(list_num)
    elsif control == "back"
       run!
    else
      no_command_message
      select_task_action(list_num)
    end
  end

end

TodoManager.new.run!
