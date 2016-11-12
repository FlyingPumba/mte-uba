# == Schema Information
#
# Table name: novedad_mecanicas
#
#  id          :integer          not null, primary key
#  observacion :string
#  fecha       :date
#  unidad_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_novedad_mecanicas_on_unidad_id  (unidad_id)
#
# Foreign Keys
#
#  fk_rails_7c59b4b518  (unidad_id => unidades.id)
#

class NovedadMecanica < ActiveRecord::Base
  validates :observacion, presence: true
  validates :fecha, presence: true

end
