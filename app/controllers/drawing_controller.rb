class DrawingController < ApplicationController

  def show
    @d = Drawing.find_by_unique_url(params[:unique_url])
  end

end