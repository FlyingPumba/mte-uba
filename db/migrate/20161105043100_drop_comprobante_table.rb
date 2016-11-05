class DropComprobanteTable < ActiveRecord::Migration
  def change
    drop_table :comprobantes
  end
end
