class AddTallerIdToNotas < ActiveRecord::Migration
  def change
    add_reference :notas_pedidos, :taller, index: true, foreign_key: true
    add_reference :notas_reparaciones, :taller, index: true, foreign_key: true
  end
end
