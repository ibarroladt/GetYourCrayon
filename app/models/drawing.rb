class Drawing < ActiveRecord::Base
  belongs_to :website
  has_many :taggings
  has_many :tags, through: :taggings
  validates :content, presence: true
  validates :website_id, presence: true

  def tags=(tags_string)
    tags = tags_string.gsub(",", " ").split(" ")
    tags.each do |tag|
      self.tags << Tag.find_or_create_by_name(tag.downcase)
    end
  end
end 
