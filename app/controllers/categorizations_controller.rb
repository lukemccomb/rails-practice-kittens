class CategorizationsController < ApplicationController
  def create
    @kitten = Kitten.find(params[:kitten_id])
    @categorization = Categorization.new(allowed_params.merge(:kitten_id => @kitten.id))
    @categorization.save!
    redirect_to "/"
  end

  private

  def allowed_params
    params.require(:categorization).permit(:category_id)
  end
end
