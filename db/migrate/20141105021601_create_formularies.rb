class CreateFormularies < ActiveRecord::Migration
  def change
    create_table :formularies do |t|
      t.string  :nombre_unidad
      t.string  :responsable_llenado
      t.date    :fecha
      t.integer :cod01
      t.integer :cod02
      t.integer :ape01
      t.integer :ape02
      t.integer :ape03
      t.integer :ape04
      t.integer :ape05
      t.integer :ape06
      t.integer :ape07
      t.integer :api01
      t.integer :api02
      t.integer :api03
      t.integer :api04
      t.integer :ssb01
      t.integer :cao01
      t.integer :cao02
      t.integer :cao03
      t.integer :cao04
      t.integer :cao05
      t.integer :cao06
      t.integer :cao07
      t.integer :cao08
      t.integer :cao09
      t.integer :cao10
      t.integer :cao11
      t.integer :cao12
      t.integer :tit01
      t.integer :uni01
      t.integer :uni02
      t.integer :uni03
      t.integer :ben01
      t.integer :ben02
      t.integer :per01
      t.integer :per02
      t.integer :user_id
      t.timestamps
    end
  end
end
