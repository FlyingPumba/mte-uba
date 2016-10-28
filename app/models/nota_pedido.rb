# == Schema Information
#
# Table name: comprobantes
#
#  id                  :integer          not null, primary key
#  type                :string
#  numeroserie         :string
#  fecha               :date
#  observation         :text
#  comprobantable_id   :integer
#  comprobantable_type :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_comprobantes_on_comprobantable_type_and_comprobantable_id  (comprobantable_type,comprobantable_id)
#

class NotaPedido < Comprobante
  has_many :detalles, as: :detallable, class_name:"Detalle", dependent: :destroy
  has_one :solicitante, class_name:"Usuario"
  has_one :autorizante, class_name:"Usuario"

  accepts_nested_attributes_for :detalles, reject_if: :all_blank, allow_destroy: true

end
