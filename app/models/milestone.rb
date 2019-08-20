class Milestone < ApplicationRecord

  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :subtasks, through: :tasks

  validates_format_of :due_date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy"
end
