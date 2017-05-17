class CreateStateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :state_districts do |t|
      t.string :state
      t.string :name
      t.timestamps
    end
  end
end
