class CreateWishedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :wished_items do |t|
      t.string :title
      t.string :external_id, null: false
      t.string :state
      t.string :description
      t.integer :bids_count, null: false, default: 0
      t.integer :next_bid

      t.timestamps
    end
  end
end
