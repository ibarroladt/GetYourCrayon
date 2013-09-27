class Drawing < ActiveRecord::Base
  belongs_to :website
  has_many :taggings
  has_many :tags, through: :taggings
end
