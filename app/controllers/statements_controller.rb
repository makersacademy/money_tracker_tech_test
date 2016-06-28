class StatementsController < ApplicationController

  def display
  end

  def index
    @statements = Statement.all
  end

  def deposit_new
    @statement = Statement.new
  end

  def deposit_create
    @statement = Statement.new(statement_params)
    return @statement.balance = statement_params[:deposit] if Statement.sum(:balance).nil?
    calculate_balance(:deposit)

    if !statement_params[:deposit].empty?
      @statement.save
      flash[:notice] = "You have deposit money"
      redirect_to root_path
    else
      flash[:notice] = "Your deposit has not gone through, you left something blank."
      render :action=>'deposit_new'
    end
  end

  def withdrawal_new
    @statement = Statement.new
  end

  def withdrawal_create
    @statement = Statement.new(statement_params)
    calculate_balance(:withdrawal)
    if !statement_params[:withdrawal].empty?
      @statement.save
      flash[:notice] = "You have withdrawal money"
      redirect_to root_path
    else
      flash[:notice] = "Your withdrawal has not gone through, you left something blank."
      render :action=>'deposit_new'
    end
  end

  private

  def calculate_balance(money_exchange)
    @statement.balance = -statement_params[money_exchange].to_f + Statement.sum(:deposit) + (-Statement.sum(:withdrawal))
  end

  def statement_params
    params.require(:statement).permit(:deposit, :withdrawal)
  end
end
