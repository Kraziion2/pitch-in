class User < ApplicationRecord

	has_many :articles, dependent: :destroy #destroy all articles created by the user if the user is removed
	has_one :profile

	before_save { self.email = email.downcase }	
	validates :username, presence:true, uniqueness: 
						{ case_sensitive: false },
						length: {minimum: 3, maximum: 25}

	VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i

	validates :email, presence: true, length: { maximum: 105},
						uniqueness: {case_sensitive: false},
						format: {with: VALID_EMAIL_REGEX}

	#validates_confirmation_of :username, :password
	#validates_confirmation_of :email, :message => "should match confirmation"
	validates_presence_of :password_confirmation, :if => :password_digest_changed?

	has_secure_password
end