class RemoveColumnFromFormulary < ActiveRecord::Migration
  def up
    remove_column :formularies, :nombre_unidad
  end

  def down
    add_column :formularies, :nombre_unidad, :string
  end
end
