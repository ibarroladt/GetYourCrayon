class Website < ActiveRecord::Base
  has_many :drawings
  has_many :taggings, through: :drawings
  has_many :tags, through: :taggings
end
