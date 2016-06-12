class User < ActiveRecord::Base
  attr_accessor :login
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_attached_file :avatar, styles: { medium: "300x300#", thumb: "40x40#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	has_many :tweets
	has_many :replies

	acts_as_followable
	acts_as_follower
	acts_as_liker

    def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["lower(username) = lower(:value) OR lower(email) = lower(:value)", { :value => login }]).first
		elsif conditions.has_key?(:username) || conditions.has_key?(:email)
			where(conditions.to_hash).first
		end
	end

	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

	validates :username,
		:presence => true,
		:uniqueness => {
		:case_sensitive => false
		} # etc.
end
