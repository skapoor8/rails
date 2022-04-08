class ReportComment < ActiveRecord::Base
    belongs_to :incident
    belongs_to :incident_question_answer
    validates :incident, presence: true
    validates :incident_question_answer, presence: true

    # Method to use memcached, grab all incidents from cache, 
    # else execute code block which queries database for the,
    def self.all_cached
        Rails.cache.fetch('ReportComment.all') { all }
    end


    # Expire the cached 'all incidents' if a new incident was
    # saved or old incident was deleted
    after_save :expire_report_comment_all_cache
    after_save :expire_report_comment_all_cache
    def expire_report_comment_all_cache()
        Rails.cache.delete('ReportComment.all')
    end
    
 end
