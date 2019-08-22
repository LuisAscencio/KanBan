class Task < ApplicationRecord
  belongs_to :milestone
  has_many :subtasks, dependent: :destroy

  #validations
  validates :title, uniqueness: true  
  validates_format_of :due_date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy"

end
