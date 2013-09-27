class Drawing < ActiveRecord::Base
  belongs_to :website
  belongs_to :user
end
