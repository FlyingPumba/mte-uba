# == Schema Information
#
# Table name: notas_reparaciones
#
#  id          :integer          not null, primary key
#  numeroserie :string
#  fecha       :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  remito      :string
#  taller_id   :integer
#
# Indexes
#
#  index_notas_reparaciones_on_taller_id  (taller_id)
#
# Foreign Keys
#
#  fk_rails_a0fcb30736  (taller_id => talleres.id)
#

class NotaReparacion < ActiveRecord::Base
  belongs_to :taller
  has_many :detalles_unidades, as: :detallable, class_name:"DetalleUnidad", dependent: :destroy
  has_many :detalles_deposito, as: :detallable, class_name:"DetalleDeposito", dependent: :destroy
  has_one :solicitante, class_name:"Usuario"
  has_one :autorizante, class_name:"Usuario"
  self.table_name = "notas_reparaciones"

  accepts_nested_attributes_for :detalles_unidades, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :detalles_deposito, reject_if: :all_blank, allow_destroy: true

  scope :by_taller, ->(taller) { where(taller_id: taller.id) }
end
