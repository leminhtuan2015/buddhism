class Album < ActiveRecord::Base
  belongs_to :photo_store
  has_many :photos, :dependent => :destroy
end
