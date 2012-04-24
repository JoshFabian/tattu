class Shot < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, :url => "/assets/:id/:basename.:extension",
  :path => ":rails_root/public/assets/:id/:basename.:extension"
  attr_accessible :title, :photo, :user_id, :alert, :index
end
