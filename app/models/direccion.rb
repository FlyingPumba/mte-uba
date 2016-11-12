# == Schema Information
#
# Table name: direcciones
#
#  id                 :integer          not null, primary key
#  calle              :string
#  altura             :integer
#  direccionable_id   :integer
#  direccionable_type :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_direcciones_on_direccionable_type_and_direccionable_id  (direccionable_type,direccionable_id)
#

class Direccion < ActiveRecord::Base
  belongs_to :direccionable, polymorphic: true

  def full_direccion
    "#{calle} #{altura}"
  end
end
