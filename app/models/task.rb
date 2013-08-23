require_relative '../../config/application' 
require 'active_record'
class Task < ActiveRecord::Base
  validates :description, presence: true
end
