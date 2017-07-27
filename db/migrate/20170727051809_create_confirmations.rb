class CreateConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :confirmations do |t|
      t.integer :event_id
      t.integer :onoff

      t.timestamps
    end
  end
end
