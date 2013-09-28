require 'json'

class SaveController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def save
    p 'X' * 100
    p
    p 'X' * 100
    @website = Website.find_or_create_by_url(params[:url])
    @drawing = @website.drawings.create(content: params[:json_string])

    tags_string = params[:tags]
    tags = tags_string.gsub(",", " ").split(" ")
    tags.each do |tag|
      @tags = @drawing.tags << Tag.find_or_create_by_name(tag)
    end
    "Success"
  end

  def retrieve
    if params[:id]
      p '*' * 100
      p "I got in here!"
      p '*' * 100

      #what to do if we get an id - grab the drawing at the specified id
      website = Website.find_by_url(params[:url])
      id = params[:id].to_i
      json_string = website.drawings[id].content
      render :text => json_string
    else
      #what to do on initial page load - grab the latest drawing, also pass max id
      p params
      website = Website.find_by_url(params[:url])
      p "****************************************"
      p website
      if website.nil?
        render :text => "website not found"
      else
        json_string = website.drawings.last.content
        max_index = website.drawings.last.id
        render :json => {"json_string" => json_string, "max_index" => max_index}.to_json
        #render :text => json_string
      end
    end
  end
end
