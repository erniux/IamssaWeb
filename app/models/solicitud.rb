class Solicitud < ApplicationRecord
	include PgSearch::Model

  	belongs_to :user 
  	belongs_to :cliente
  	belongs_to :proyecto

  	has_many :cotizacions
  	
  	validates_presence_of :cliente, :estatus, :proyecto_id

  	pg_search_scope :search_by_full_solicitud, associated_against: { cliente: [:nombre_fiscal, :nombre_comercial, :rfc], 
  																	 proyecto: [ :nombre_proyecto ] },
											   using:   {tsearch: { prefix: true }}	

    def lista_cliente
      cliente = Cliente.where(id: self.cliente_id).first
      nombre = 'Solicitud: ' + ' ' + self.id.to_s + '; Cliente: ' + cliente.nombre_fiscal
    end                         

end