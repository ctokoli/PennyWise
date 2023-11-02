class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = Expense.all
  end

  def new
    @categories = current_user.category
    @expense = current_user.expense.build
  end

  def show
    @expense = Expense.find_by(id: params[:id])
  end

  def create
    @expense = current_user.expense.build(expense_params)
    if @expense.save
      flash[:notice] = 'Expense was successfully created.'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end
