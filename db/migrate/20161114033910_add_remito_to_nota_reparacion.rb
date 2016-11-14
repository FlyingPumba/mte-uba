class AddRemitoToNotaReparacion < ActiveRecord::Migration
  def change
    add_column :notas_reparaciones, :remito, :string
  end
end
