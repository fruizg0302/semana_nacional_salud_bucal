class CreateJurisdictions < ActiveRecord::Migration
  def change
    create_table :jurisdictions do |t|
      t.integer :jurisdiction_anterior_id
      t.integer :state_id
      t.integer :municipio_id
      t.string :jurisdiction

      t.timestamps
    end
  end
end
