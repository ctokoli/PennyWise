class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.includes(:expenses).where(user_id: current_user.id)
    @total_price = total_expenses(:id)
  end

  def new
    @category = current_user.category.build
  end

  def show
    @category = Category.find_by(id: params[:id])
    @expenses = @category.expenses
    @total_price = @category.expenses.sum(:amount)
  end

  def create
    @category = current_user.category.build(category_params)
    if @category.save
      flash[:success] = 'Category created!'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def total_expenses(id)
    @category = Category.find_by(id:)
    if @category
      @category.expenses.sum(:amount)
    else
      0
    end
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
