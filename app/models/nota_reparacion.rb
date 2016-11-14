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
#

class NotaReparacion < ActiveRecord::Base
  has_many :detalles, as: :detallable, class_name:"Detalle", dependent: :destroy
  has_one :solicitante, class_name:"Usuario"
  has_one :autorizante, class_name:"Usuario"
  self.table_name = "notas_reparaciones"

  accepts_nested_attributes_for :detalles, reject_if: :all_blank, allow_destroy: true
end
