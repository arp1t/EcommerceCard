class CreateDebitCards < ActiveRecord::Migration
  def change
    create_table :debit_cards do |t|
      t.integer :user_id
      t.string :card_number
      t.string :expiration_date
      t.string :cvv
      t.integer :last_four
    end
  end
end
