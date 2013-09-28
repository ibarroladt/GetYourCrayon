module ApplicationHelper

  def find_random_urls(tag_objects)
    Hash[tag_objects.collect {|v| [v.name, v.websites.sample.url] } ]
  end

  def make_html(tag_objects)
    tags_url_hash = find_random_urls(tag_objects)
    tags_url_hash.map do |k, v|
      "<a href='#{v}'>#{k}</a>"
    end
  end

end
