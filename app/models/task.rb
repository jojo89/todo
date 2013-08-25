require_relative '../../config/application' 
require 'active_record'
class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :list_id, presence: true
  belongs_to :list
end
