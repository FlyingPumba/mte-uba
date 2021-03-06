# == Schema Information
#
# Table name: detalles_unidades
#
#  id              :integer          not null, primary key
#  cantidad        :integer
#  descripcion     :string
#  detallable_id   :integer
#  detallable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  unidad_id       :integer
#
# Indexes
#
#  index_detalles_unidades_on_detallable_type_and_detallable_id  (detallable_type,detallable_id)
#  index_detalles_unidades_on_unidad_id                          (unidad_id)
#
# Foreign Keys
#
#  fk_rails_22a72bdc35  (unidad_id => unidades.id)
#

class DetalleUnidad < ActiveRecord::Base
  belongs_to :unidad, :class_name => Unidad, :foreign_key => 'unidad_id'
  self.table_name = "detalles_unidades"
end
