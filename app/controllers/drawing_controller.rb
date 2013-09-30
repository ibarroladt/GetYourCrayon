class DrawingController < ApplicationController

  impressionist unique: [:impressionable_type, :impressionable_id, :session_hash]

  def show
    @drawing = Drawing.find_by_unique_url(params[:unique_url])
    impressionist(@drawing)
  end

end