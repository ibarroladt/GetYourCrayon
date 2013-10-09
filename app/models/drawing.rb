class Drawing < ActiveRecord::Base
  belongs_to :website
  has_many :taggings
  has_many :tags, through: :taggings
  before_save :create_url
  validates :content, presence: true
  validates :website_id, presence: true

  is_impressionable :counter_cache => true, :unique => :session_hash
  
  def tags=(tags_string)
    tags = tags_string.gsub(",", " ").split(" ")
    tags.each do |tag|
      self.tags << Tag.find_or_create_by(name:tag.downcase)
    end
  end

  def create_url
    letters_numbers = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a
    url_string = ''
    5.times { url_string << letters_numbers.sample }
    url_string 
    if set_unique_url(url_string) == "repeat"
      create_url
    end
  end

  def set_unique_url(url)
    if Drawing.find_by(unique_url: url)
      "repeat"
    else
      self.unique_url = url
    end
  end
end 


