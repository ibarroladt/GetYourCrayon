class DrawingController < ApplicationController

  impressionist unique: [:impressionable_type, :impressionable_id, :session_hash]

  def show
    @drawing = Drawing.find_by_unique_url(params[:unique_url])
    impressionist(@drawing)
    @snippet = fetch_url @drawing.website.url
  end


  def fetch_url(url)
    r = Net::HTTP.get_response( URI.parse( url ) )
    if r.is_a? Net::HTTPSuccess
      r.body
    else
      nil
    end
  end

end

