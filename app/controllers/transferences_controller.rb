class TransferencesController < ApplicationController
  before_action :transference_amount, only: %i[ create ]
  before_action :transference_receiver, only: %i[ create ]

  def create
    sender = current_user.id
    TransferenceServices::TransferenceCreateService.new(@amount, @receiver, sender).call
    redirect_to home_path(sender)
  end

  private

  def transference_amount
    @amount = params[:amount].to_i
  end

  def transference_receiver
    @receiver = User.find_by(email: params[:email]) ?  User.find_by(email: params[:email]).id : nil
  end

end
