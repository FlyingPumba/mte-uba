# == Schema Information
#
# Table name: talleres
#
#  id         :integer          not null, primary key
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
# Indexes
#
#  index_talleres_on_owner_id  (owner_id)
#

class Taller < ActiveRecord::Base
  has_many :lugares, as: :direccionable, class_name:"Direccion", dependent: :destroy
  has_many :memberships, class_name: "Membership"
  has_many :usuarios, through: :memberships, class_name:"Usuario"

  accepts_nested_attributes_for :lugares, reject_if: :all_blank, allow_destroy: true

  has_many :choferes, foreign_key:'taller_id', class_name:"Chofer"
  has_many :unidades, foreign_key:'taller_id', class_name:"Unidad"
  has_many :notas_pedidos, foreign_key:'taller_id', class_name:"NotaPedido"
  has_many :notas_reparaciones, foreign_key:'taller_id', class_name:"NotaReparacion"
  has_many :unidades, foreign_key:'taller_id', class_name:"Unidad"
  has_many :turnos, foreign_key:'taller_id', class_name:"Turno"
  has_many :proveedores, foreign_key:'taller_id', class_name:"Proveedor"
  belongs_to :owner, class_name: 'Usuario'

  # serialize :engines
  validates_presence_of :nombre

  #before_create :set_default_engines
  after_create :generate_membership

  def main_address
    direcciones.first
  end

  def to_s
    full_name
  end

  def full_name
    nombre.capitalize
  end

  def add_usuario(usuario)
    self.memberships << Membership.new(role_id: Role.operador.id, usuario: usuario, current: true)
  end

  def remove_usuario(usuario)
    self.usuarios.delete(usuario)
  end

  private

  # Set all the engines as default
  #def set_default_engines
  #  logger.debug('set default engines')
  #  self.engines = Rails.application.config.engines
  #end

  # Generate membership inner created company and the owner user (as Admin)
  def generate_membership
    Membership.create(taller_id: id, role_id: Role.propietario.id, usuario_id: owner_id, current: true)
    Role.administrador
    Role.operador
    Role.propietario
  end




end
