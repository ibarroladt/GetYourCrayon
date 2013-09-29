class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper
  helper_method :make_html

  def grab_drawing(url, id)
    website = Website.find_by_url(url)
    id = id.to_i
    website.drawings[id].content
  end

end
