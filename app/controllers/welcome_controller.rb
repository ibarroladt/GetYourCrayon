class WelcomeController < ApplicationController
  def index
  	pull = Tag.order("taggings_count DESC").first(300)
  	@max_count = pull.first.taggings_count
  	@tags = pull.shuffle
  end

  def search
    pull = Tag.where("name = ?", params[:search_input])
    @max_count = pull.first.taggings_count
    @tags = pull.shuffle
  end
end
