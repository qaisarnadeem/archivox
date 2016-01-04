class User < ActiveRecord::Base
	validates_presence_of :email,:encrypted_password,:password
	validates_uniqueness_of :email
	validates_length_of :password, :minimum => 6
	before_save :encrypt_password
	after_save :clear_password
    attr_accessor :password 
    private 
    def encrypt_password
  	  self.encrypted_password=Digest::SHA1.hexdigest(self.password) if self.password.present?
    end

    def clear_password
       self.password=nil
    end
end
