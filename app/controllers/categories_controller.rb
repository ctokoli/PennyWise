class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:name])
    @products = @category.products
  end
end
