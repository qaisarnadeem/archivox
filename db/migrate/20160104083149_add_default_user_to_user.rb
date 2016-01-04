class AddDefaultUserToUser < ActiveRecord::Migration
  def change
  	User.create(:email=>'admin@archivox.com',:password=>'admin123',:encrypted_password=>Digest::SHA1.hexdigest('admin123'))
  end
end