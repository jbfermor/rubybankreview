class TransferencesController < ApplicationController
  before_action :authenticate_user!
  before_action :transference_amount, only: %i[ create ]
  before_action :transference_receiver, only: %i[ create ]

  def create
    sender = current_user.id
    TransferenceServices::TransferenceCreateService.new(@amount, @receiver, sender).call
  end

  private

  def transference_amount
    @amount = params[:amount].to_i
  end

  def transference_receiver
    @receiver = params[:receiver].to_i
  end

end
