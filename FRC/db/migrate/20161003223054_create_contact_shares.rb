class CreateContactShares < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false
    end
  end
end
