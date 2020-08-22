class Solicitud < ApplicationRecord
	include PgSearch::Model

  	belongs_to :cliente
  	has_one :proyecto

  	validates_presence_of :cliente, :proyecto, :estatus, :nombre_contacto, :telefono_directo


  	pg_search_scope :search_by_full_solicitud, associated_against: { proyectos: [:nombre_proyecto, :responsable] },
											   against: [:cliente_id, :id, :cliente_contacto_id ],	
											   using:   {tsearch: { prefix: true }}	

end