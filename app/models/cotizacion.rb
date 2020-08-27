class Cotizacion < ApplicationRecord
	include PgSearch::Model
  	
  	belongs_to :solicitud

  	has_many :cotizacion_detalles, inverse_of: :cotizacion, dependent: :destroy
	accepts_nested_attributes_for :cotizacion_detalles, reject_if: :all_blank, allow_destroy: true


	pg_search_scope :search_by_full_cotizacion, associated_against: { cliente: [:nombre_fiscal] },
											using:   {tsearch: { prefix: true }}			  
   
   def cliente(id)
   	cliente = Cliente.where(id: id).first.nombre_fiscal
   end

   def contacto(id)
   	busqueda = ClienteContacto.where(id: id).first
   	contacto = busqueda.nombre + ' ' + busqueda.appaterno.to_s + ' ' + busqueda.apmaterno.to_s
   end
end
