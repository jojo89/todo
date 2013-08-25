require_relative '../../config/application' 
require 'active_record'
class List < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :tasks
end