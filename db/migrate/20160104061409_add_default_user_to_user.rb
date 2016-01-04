class AddDefaultUserToUser < ActiveRecord::Migration
  def change
  	User.create(:email=>'admin@archivox.com',:password=>'admin')
  end
end
