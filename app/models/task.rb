class Task < ApplicationRecord
  belongs_to :milestone, dependent: :destroy
  has_many :subtasks
end
