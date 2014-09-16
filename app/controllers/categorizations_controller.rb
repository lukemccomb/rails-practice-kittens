class CategorizationsController < ApplicationController
  def create
    @kitten = Kitten.find(params[:kitten_id])
    @categories = Category.all
    @categorization = Categorization.new(allowed_params.merge(:kitten_id => @kitten.id))
    if @categorization.save
      redirect_to root_path
    else
      render 'kittens/show'
    end
  end

  private

  def allowed_params
    params.require(:categorization).permit(:category_id)
  end
end
