class Task < ApplicationRecord
  belongs_to :milestone
  has_many :subtasks, dependent: :destroy
end
