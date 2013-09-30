class Tagging < ActiveRecord::Base
  belongs_to :drawing
  belongs_to :tag
  validates :drawing_id, presence: true
  validates :tag_id, presence: true
end
