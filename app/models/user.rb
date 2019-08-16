class User < ApplicationRecord
    has_many :milestones
    has_many :tasks, through: :milestones
    has_many :subtasks, through: :tasks
#User account creation validations
    validates :name, length: {in: 3..25}
    validates :name, :presence => true
    validates :name, uniqueness: true
    validates :username, :presence => true
    validates :username, uniqueness: true
    validates :password, :presence => true


end
