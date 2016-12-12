class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
    end
    User.create first_name: 'Adam', last_name: 'Smith'
    User.create first_name: 'Lisa', last_name: 'Williams'
  end
end
