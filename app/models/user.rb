class User < ApplicationRecord
    has_many :milestones
    has_many :tasks, through: :milestones
    has_many :subtasks, through: :tasks

end
