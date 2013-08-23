# require_relative '../config'

class CreateTasks < ActiveRecord::Migration
  def change

    create_table :tasks do |t|
      t.string :description
      t.boolean :completeness, default: false
      t.timestamps
    end
  end
end
 
