class TransferencesController < ApplicationController
  before_action :authenticate_user!

  def create
    sender = current_user
    TransferenceServices::TransferenceCreateService.new(@amount, @receiver, sender).call
  end

  private

  def transference_amount
    @amount = params[:transference][:amount]
  end

  def transference_receiver
    @receiver = params[:transference][:receiver]
  end

end
