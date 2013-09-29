require 'json'

class SaveController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def save
    @website = Website.find_or_create_by_url(params[:url])
    @drawing = @website.drawings.create(content: params[:json_string], tags: params[:tags])
    render :text => "Success"
  end

  def retrieve
    if params[:id]
      # ID here refers to the index of the array of drawings for this website
      json_string = grab_drawing(params[:url], params[:id])
      render :text => json_string
    else
      #what to do on initial page load - grab the latest drawing, also pass max id
      website = Website.find_by_url(params[:url])
      tag_objects = website.tags.order("created_at DESC").limit(5)
      tags_html_string = make_html(tag_objects).join("")
      # send tag_names to helper method that creates links for each tag

      if website.nil?
        render :text => "website not found"
      else
        json_string = website.drawings.last.content
        max_index = website.drawings.length - 1
        render :json => {"json_string" => json_string, "max_index" => max_index, "tags_html_string" => tags_html_string}.to_json
        #render :text => json_string
      end
    end
  end
end
