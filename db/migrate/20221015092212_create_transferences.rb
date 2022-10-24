class CreateTransferences < ActiveRecord::Migration[7.0]
  def change
    create_table :transferences do |t|
      t.integer :amount, null: false
      t.integer :sender, null: true
      t.integer :receiver,  null: false
      t.integer :final_balance,  null: false
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
