# == Schema Information
#
# Table name: detalles_deposito
#
#  id              :integer          not null, primary key
#  cantidad        :integer
#  descripcion     :string
#  detallable_id   :integer
#  detallable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_detalles_unidades_on_detallable_type_and_detallable_id  (detallable_type,detallable_id)
#

class DetalleDeposito < ActiveRecord::Base
  self.table_name = "detalles_deposito"
end
