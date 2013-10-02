class DrawingController < ApplicationController

  impressionist unique: [:impressionable_type, :impressionable_id, :session_hash]

  def show
    @drawing = Drawing.find_by_unique_url(params[:unique_url])
    impressionist(@drawing)
  end

  def index
  	@tag = Tag.find(params[:tag_id])
  	websites = @tag.websites
    @unique_websites = []
    websites.each do |website|
      unless @unique_websites.include?(website)
        @unique_websites << website
      end
    end
  end
end

