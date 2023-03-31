class PagesController < ApplicationController
  def home
    @articles = Article.order("RAND()").limit(3)
  end

  def about; end
end