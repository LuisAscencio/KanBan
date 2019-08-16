class Subtask < ApplicationRecord
  belongs_to :task, dependent: :destroy
end
