class PhotoStore < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
end
