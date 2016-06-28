class StatementsController < ApplicationController

  def display
  end

  def index
  end

  def deposit_new
    @statement = Statement.new
  end

  def deposit_create
    @statement = Statement.new(statement_params)
    if Statement.sum(:balance).nil?
      @statement.balance = statement_params[:deposit]
    else
      @statement.balance = statement_params[:deposit].to_f + Statement.sum(:deposit) + (-Statement.sum(:withdrawal))
    end

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
    @statement.balance = -statement_params[:withdrawal].to_f + Statement.sum(:deposit) + (-Statement.sum(:withdrawal))
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

  def statement_params
    params.require(:statement).permit(:deposit, :withdrawal)
  end
end
