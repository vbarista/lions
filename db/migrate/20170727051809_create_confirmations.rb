class CreateConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :confirmations do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :onoff
      t.string  :reason_for_off
      
      t.string  :guest1_company
      t.string  :guest1_name
      t.string  :guest1_position
      t.string  :guest2_company
      t.string  :guest2_name
      t.string  :guest2_position
      t.string  :guest3_company
      t.string  :guest3_name
      t.string  :guest3_position
      t.string  :guest4_company
      t.string  :guest4_name
      t.string  :guest4_position
      t.string  :guest5_company
      t.string  :guest5_name
      t.string  :guest5_position
      t.timestamps
    end
  end
end
