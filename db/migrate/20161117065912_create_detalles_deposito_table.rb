class CreateDetallesDepositoTable < ActiveRecord::Migration
  def change
    create_table :detalles_deposito do |t|
      t.integer :cantidad
      t.string :descripcion
      t.references :detallable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
