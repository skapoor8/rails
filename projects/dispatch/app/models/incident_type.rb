class IncidentType < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates :default_severity, numericality: { 
        only_integer: true,
        greater_than_or_equal_to: 1,
        less_than_or_equal_to: 10
    }
end
