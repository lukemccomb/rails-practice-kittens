class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
    @categories = Category.all
    @categorization = Categorization.new
  end

end