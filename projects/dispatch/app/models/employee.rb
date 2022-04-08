class Employee < ActiveRecord::Base
    belongs_to :user
    belongs_to :department
    validates :user, presence: true
    validates :department, presence: true
end
