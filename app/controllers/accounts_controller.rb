class AccountsController < ApplicationController

  def index
  end

  def deposit_new
    @account = Account.new
  end

  def deposit_create
    @account = Account.new(account_params)
    if @account.save
      flash[:notice] = "You have deposit money"
      redirect_to account_path(@account)
    else
      flash[:notice] = "Your deposit has not gone through, you left something blank."
      render :action=>'deposit_new'
    end
  end

  private

  def account_params
    params.require(:account).permit(:deposit, :withdrawal)
  end
end
