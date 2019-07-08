class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :code
      t.string :state, default: "created"

      t.timestamps
    end
  end
end
