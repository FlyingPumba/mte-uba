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

class Comprobante < ActiveRecord::Base
  belongs_to :comprobantable, polymorphic: true

  belongs_to :cliente, class_name: 'Cliente', foreign_key: :cliente_id
  #belongs_to :condicioncomprobante, class_name: 'Condicioncomprobante', foreign_key: 'condicioncomprobante_id'

  #belongs_to :voucher, class_name: 'Voucher', foreign_key: 'voucher_id'

  #has_many :attachments, as: :attachable, dependent: :restrict_with_exception

  #has_many :detalles, as: :detallable, dependent: :destroy do
 #   def calculo_total_items
 #   end


  #end

  #accepts_nested_attributes_for :detalles, allow_destroy: true, reject_if: :all_blank
  #accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates :fecha, presence: true

  validates :numeroserie, presence: true, length: { maximum: 8 }, uniqueness: { scope: [:type] }

  validates_presence_of :comprobantable
  validates_associated :comprobantable

  #validate :fecha_greater_than_last_comprobante, on: :create

  def to_s
    dato = ' sin cpb '
    dato = "#{fecha} #{type_and_number}" unless self.blank?
    dato
  end

  #def last_within
  #    .where(type:type).order(:numeroserie).last || Comprobante.new(numeroserie: "0", fecha: Date.today)
  #end

  #def last_number
  #  last_within.numeroserie
  #end

  def taller
    comprobantable.taller
  end

  def taller_id
    comprobantable.taller_id
  end

  # TODO, importe debe ser la suma de los totales de los items
  # validates :importe, :presence => true, :numericality => true
  def type_and_number
    type = self.type
    type.slice! 'Comprobante'
    "#{type.downcase.capitalize} #{numero_comprobante}"
  end

  def numero_comprobante
    numeroserie#'%1c %08d' % ['X', numeroserie.blank? ? "0" : numeroserie]
  end

  def count_items
    detalles.count
  end

  protected

  #def fecha_greater_than_last_comprobante
  #  last_comprobante = last_within
  #
  #  if last_comprobante
  #    result = fecha >= last_comprobante.fecha
  #  else
  #    result = true
  #  end
  #
  #  errors.add :base, 'La fecha debe ser mayor a la del ultimo comprobante' unless result
  #
  #  result
  #end

end
