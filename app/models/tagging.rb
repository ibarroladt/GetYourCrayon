class Tagging < ActiveRecord::Base
  belongs_to :drawing
  belongs_to :tag
end
