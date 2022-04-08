class IncidentQuestion < ActiveRecord::Base
    belongs_to :incident_type
    validates :question, presence: true,
                            length: { minimum: 3 }
    validates :question_form, presence: true, numericality: {
        only_integer: true,
        greater_than_or_equal_to: 0,
        less_than_or_equal_to: 5
    }
    validates :min_val, numericality: { only_integer: true }
    validates :max_val, numericality: { only_integer: true }
    validates :incident_type, presence: true

    #TODO add self.all_cached like in incident.rb
   
    # Method to use memcached, grab all incidents from cache, 
    # else execute code block which queries database for the,
    def self.all_cached
        Rails.cache.fetch('IncidentQuestion.all') { all }
    end


    # Expire the cached 'all incidents' if a new incident was
    # saved or old incident was deleted
    after_save :expire_incident_question_all_cache
    after_save :expire_incident_question_all_cache
    def expire_incident_question_all_cache()
        Rails.cache.delete('IncidentQuestion.all')
    end
    
             
end
