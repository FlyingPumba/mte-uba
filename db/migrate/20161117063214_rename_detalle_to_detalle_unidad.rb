class RenameDetalleToDetalleUnidad < ActiveRecord::Migration
  def change
    rename_table :detalles, :detalles_unidades
  end
end
