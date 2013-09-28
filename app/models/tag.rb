class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :drawings, through: :taggings
  has_many :websites, through: :drawings
end
