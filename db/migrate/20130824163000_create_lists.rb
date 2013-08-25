class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.timestamps
    end

    create_table :tasks do |t|
      t.belongs_to :list
      t.string :description
      t.boolean :completeness, default: false
      t.timestamps
    end
  end
end