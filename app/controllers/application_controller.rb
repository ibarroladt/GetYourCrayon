class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def grab_drawing(website, id)
    id = id.to_i
    json_string = website.drawings[id].content
    render :text => json_string
  end

  def retrieve_latest_drawing(website)
    json_string = website.drawings.last.content
    max_index = website.drawings.empty? ? nil : website.drawings.length - 1
    render :json => {"json_string" => json_string, "max_index" => max_index, "tags_html_string" => tags_html_string(website)}.to_json
  end

  def find_random_urls(tag_objects)
    Hash[tag_objects.collect {|v| [v.name, v.websites.sample.url] } ]
  end

  def make_html(tag_objects)
    tags_url_hash = find_random_urls(tag_objects)
    tags_url_hash.map do |k, v|
      "<a href='#{v}'>#{k}</a>"
    end
  end

  def tags_html_string(website)
    tag_objects = website.tags.order("created_at DESC").limit(5)
    tags_html_string = make_html(tag_objects).join("")
  end

end
