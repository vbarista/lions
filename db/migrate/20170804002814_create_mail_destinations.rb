class CreateMailDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_destinations do |t|
      t.integer :event_id
      t.integer :group_id

      t.timestamps
    end
  end
end
