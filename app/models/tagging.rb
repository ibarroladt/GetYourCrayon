class Tagging < ActiveRecord::Base
  belongs_to :drawing
  belongs_to :tag, counter_cache: true

end
