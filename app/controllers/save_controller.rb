class SaveController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def save
    p 'X' * 100
    p
    p 'X' * 100
    @website = Website.find_or_create_by_url(params[:url])
    @drawing = @website.drawings.create(content: params[:json_string])
    "Success"
  end
end
