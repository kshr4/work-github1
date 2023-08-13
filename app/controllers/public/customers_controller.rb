class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


end
