require 'json'

class SaveController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def save
    @website = Website.find_or_create_by_url(params[:url])
    @drawing = @website.drawings.create(content: params[:json_string], tags: params[:tags])
    render :text => "Success"
  end

  def retrieve
    website = Website.find_by_url(params[:url])
    if website.nil?
      render :text => "website not found"
    else
      if params[:id]
        grab_drawing(website, params[:id])
      else
        retrieve_latest_drawing(website)
      end
    end
  end

end
