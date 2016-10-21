class CreateComprobantes < ActiveRecord::Migration
  def change
    create_table :comprobantes do |t|
      t.string :type
      t.string :numeroserie
      t.date :fecha
      t.text :observation
      t.references :comprobantable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
