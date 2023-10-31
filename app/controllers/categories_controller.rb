class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = current_user.category.build
  end

  def show
    @category = Category.find_by(id: params[:id])
    @expenses = @category.expenses
  end

  def create
    @category = current_user.category.build(category_params)
    if @category.save
      flash[:success] = "Category created!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
