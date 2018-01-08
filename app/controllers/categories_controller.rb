class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.json { render :show, status: :created, location: @category }
      else
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.fetch(:category).permit(:name)
  end
end
