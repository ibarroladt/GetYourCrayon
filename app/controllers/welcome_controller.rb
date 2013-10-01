class WelcomeController < ApplicationController
  def index
  	@tags = Tag.order("taggings_count DESC").first(300)
  end
end
