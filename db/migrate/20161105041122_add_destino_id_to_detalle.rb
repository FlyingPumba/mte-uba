class AddDestinoIdToDetalle < ActiveRecord::Migration
  def change
    add_reference :detalles, :unidad, index: true
    add_foreign_key :detalles, :unidades
  end
end
