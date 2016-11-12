class CreateNovedadMecanicas < ActiveRecord::Migration
  def change
    create_table :novedad_mecanicas do |t|
      t.string :observacion
      t.date :fecha
      t.belongs_to :unidad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
