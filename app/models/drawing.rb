class Drawing < ActiveRecord::Base
  belongs_to :website
  has_many :taggings
  has_many :tags, through: :taggings
  before_save :unique_url
  validates :content, presence: true
  validates :website_id, presence: true

  is_impressionable :counter_cache => true, :unique => :session_hash
  
  def tags=(tags_string)
    tags = tags_string.gsub(",", " ").split(" ")
    tags.each do |tag|
      self.tags << Tag.find_or_create_by_name(tag.downcase)
    end
  end

  def unique_url
    letters_numbers = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a
    url_string = ''
    5.times { url_string << letters_numbers.sample }
    self.unique_url = url_string
  end
end 
