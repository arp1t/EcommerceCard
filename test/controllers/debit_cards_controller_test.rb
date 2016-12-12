require 'test_helper'

class DebitCardsControllerTest < ActionController::TestCase
  setup do
    @debit_card = debit_cards(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should update debit_card" do
    patch :update, id: @debit_card, debit_card: { card_number: @debit_card.card_number, cvv: @debit_card.cvv, expiration_date: @debit_card.expiration_date, last_four: @debit_card.last_four, user_id: @debit_card.user_id }
    assert_redirected_to debit_card_path(assigns(:debit_card))
  end
  
end
