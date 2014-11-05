class AddNameApPaternoApMaternoJurisdictionIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :ap_paterno, :string
    add_column :users, :ap_materno, :string
    add_column :users, :jurisdiction_id, :integer
  end
end
