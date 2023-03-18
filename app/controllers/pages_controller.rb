# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @articles = Article.order("RANDOM()").limit(3)
  end

  def about; end
end
