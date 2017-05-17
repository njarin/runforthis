class CreateStateLegislators < ActiveRecord::Migration[5.0]
  def change
    create_table :state_legislators do |t|
      t.string :full_name
      t.string :title
      t.string :party
      t.string :website
      t.string :term_end
      t.integer :state_district_id

      t.timestamps
    end
  end
end
