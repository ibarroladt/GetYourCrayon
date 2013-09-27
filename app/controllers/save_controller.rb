class SaveController < ApplicationController
  def save
    "Hello"
  end

  def retrieve
    website = Website.find_by_url(params[:url])
    json_string = website.drawings.last.content
    render :text => json_string
  end
end
