class Response < ActiveRecord::Base
  belongs_to :incident
  belongs_to :user
  validates :incident, presence: true
  validates :user, presence: true
  validates :custom_comment, presence: true
    # Method to use memcached, grab all incidents from cache, 
    # else execute code block which queries database for the,
    def self.all_cached
        Rails.cache.fetch('Response.all') { all }
    end


    # Expire the cached 'all incidents' if a new incident was
    # saved or old incident was deleted
    after_save :expire_response_all_cache
    after_save :expire_response_all_cache
    def expire_response_all_cache()
        Rails.cache.delete('Response.all')
    end
    
 end
