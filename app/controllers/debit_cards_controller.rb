class DebitCardsController < ApplicationController

  def new
    params[:user_id].blank? ? (@user = User.find_by_id(1)) : (@user = User.find_by_id(params[:user_id]))
    @debit_card = DebitCard.find_or_create_by(user_id: @user.id)
  end

  def update
    @debit_card = DebitCard.find_by_id(params['id'])
    @payment_from = debit_card_params['payment_from']

    if @payment_from == 'new'
      #Check if card is valid
      if @debit_card.update(debit_card_params)
        @status_code = @debit_card.stub_perform_payment(100)
      end
    elsif @payment_from == 'existing'
      @status_code = @debit_card.stub_perform_payment(100)
    end
    
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def debit_card_params
      params.require(:debit_card).permit(:user_id, :card_number, :expiration_date, :cvv, :last_four, :payment_from)
    end
end
