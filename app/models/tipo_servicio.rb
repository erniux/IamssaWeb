class TipoServicio < ApplicationRecord
	include PgSearch::Model

	has_many :servicios, inverse_of: :tipo_servicio, dependent: :destroy

	accepts_nested_attributes_for :servicios, reject_if: :all_blank, allow_destroy: true

	
	validates_presence_of :clave, :descripcion	
	validates_uniqueness_of :clave

	pg_search_scope :search_by_full_tipo_servicio, associated_against: { servicios: [:concepto] },
											against: [:clave, :descripcion ],	
											using:   {tsearch: { prefix: true }}		

 
end
