class Milestone < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :subtasks, through: :tasks
end
