class Department < ActiveRecord::Base
    validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates(:email, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: true)
	validates(:phone_number, length: {maximum: 10}, uniqueness: {case_sensitive: false})

end
