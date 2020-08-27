class TipoServicio < ApplicationRecord
	has_many :servicios, inverse_of: :tipo_servicio, dependent: :destroy

	accepts_nested_attributes_for :servicios, reject_if: :all_blank, allow_destroy: true

	
	validates_presence_of :clave, :descripcion	
	validates_uniqueness_of :clave
end
