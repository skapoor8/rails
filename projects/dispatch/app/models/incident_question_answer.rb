class IncidentQuestionAnswer < ActiveRecord::Base
    belongs_to :incident_question
    validates :answer, presence: true
    validates :default_answer, inclusion: { in: [true, false] }
    validates :incident_question, presence: true
    #TODO add self.all_cached like in incident.rb

end
