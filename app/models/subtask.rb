class Subtask < ApplicationRecord
  belongs_to :task
  
  #validations
  validates :title, uniqueness: true  


end
