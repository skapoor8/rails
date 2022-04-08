class IncidentResponse < ActiveRecord::Base
    has_many :report_comments
    has_many :report_custom_comments
    belongs_to :incident
end
