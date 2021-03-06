
# == Schema Information
#
# Table name: unidades
#
#  id              :integer          not null, primary key
#  patente         :string
#  marca           :string
#  año             :integer
#  fueraDeServicio :boolean
#  taller_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_unidades_on_taller_id  (taller_id)
#
# Foreign Keys
#
#  fk_rails_9f7ec4ef64  (taller_id => talleres.id)
#

class Unidad < ActiveRecord::Base
  belongs_to :taller
  has_many :unidad_choferes, class_name: 'UnidadChofer', dependent: :destroy
  has_many :choferes,-> {uniq} ,through: :unidad_choferes, dependent: :destroy
  has_many :novedades_mecanicas, class_name: "NovedadMecanica", dependent: :destroy

  accepts_nested_attributes_for :unidad_choferes, reject_if: :all_blank, allow_destroy: true
  scope :by_taller, ->(taller) { where(taller_id: taller.id) }
  scope :by_patente, ->(patente) { where('patente = ?', patente) }

  validates :taller, presence: true
  validates :patente, presence: true
  validates :marca, presence: true
  validates :año, presence: true
  validates_uniqueness_of :patente, scope: :taller_id

  has_many :detalles, class_name: 'DetalleUnidad', dependent: :restrict_with_exception
  # has_many :nota_reparaciones, class_name: 'NotaReparacion', dependent: :restrict_with_exception
  # has_many :nota_pedidos, class_name: 'NotaPedido', dependent: :restrict_with_exception

  before_destroy :control_sin_detalles

  #belongs_to :zona

  #accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  #accepts_nested_attributes_for :day_deliveries, reject_if: :all_blank, allow_destroy: true

  # funcionalidad: accesible_by(current_ability))
  # 1) rails g cancan:ability
  def full_name
    "#{patente}"
  end

  def control_sin_detalles
    if [detalles].any? { |cpbte| cpbte.any? }
      errors.add(:base, "La cuenta posee #{detalles.count} detalles asociados.")
      false
    end
  end

  def index_path
  end

end
