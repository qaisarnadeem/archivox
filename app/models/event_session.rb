class EventSession < ActiveRecord::Base
	validates_presence_of :code,:title
	has_many :questions,:dependent => :destroy
	validates_uniqueness_of :code,:message=>"must be uniq to identify event"
	scope :active ,->{where(:status => true)}
end
