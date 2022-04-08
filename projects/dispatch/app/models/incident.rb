class Incident < ActiveRecord::Base
    include Filterable
    # each incident has an incident type
    belongs_to :incident_type
    # TODO add has many associations for comments/custom comments
    has_one :incident_response
    has_many :report_comments, through: :incident_response
    has_many :report_custom_comments, through: :incident_response

    accepts_nested_attributes_for :incident_response, :report_comments, :report_custom_comments
    
    # incident validations
    validates :name, presence: true,
                       length: { minimum: 2 }
    validates :location, presence: true
    validates :start_date, presence: true
    validates :severity, presence: true, numericality: { 
        only_integer: true,
        greater_than_or_equal_to: 1,
        less_than_or_equal_to: 10
    }
    validates :incident_type, presence: true
   
    # Method to use memcached, grab all incidents from cache, 
    # else execute code block which queries database for the,
    def self.all_cached
        Rails.cache.fetch('Incident.all') { all }
    end


    # Expire the cached 'all incidents' if a new incident was
    # saved or old incident was deleted
    after_save :expire_incident_all_cache
    after_save :expire_incident_all_cache
    def expire_incident_all_cache()
        Rails.cache.delete('Incident.all')
    end
    
    def save(*args)
        super
    rescue Exception => e
        # Failed Unique Constraint
        if e.is_a? ActiveRecord::RecordNotUnique
            errors[:base] << :taken
            false
        # Failed some other database constraint
        else
            errors[:base] << :invalid
            false
        end
    end
end
