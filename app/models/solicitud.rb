class Solicitud < ApplicationRecord
	include PgSearch::Model

  	belongs_to :user 
  	belongs_to :cliente
  	belongs_to :proyecto
  	
  	  
  

  	validates_presence_of :cliente, :estatus, :proyecto_id


  	pg_search_scope :search_by_full_solicitud, associated_against: { cliente: [:nombre_fiscal, :nombre_comercial, :rfc], 
  																	 proyecto: [ :nombre_proyecto ] },
											   using:   {tsearch: { prefix: true }}	

end