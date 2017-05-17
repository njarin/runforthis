class CreateResourcesStateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :resources_state_districts do |t|
      t.integer :resource_id
      t.integer :state_district_id
    end
  end
end
