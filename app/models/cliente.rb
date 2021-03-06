class Cliente < ApplicationRecord
	include PgSearch::Model
	
	has_many :cliente_contactos, inverse_of: :cliente, dependent: :destroy
	accepts_nested_attributes_for :cliente_contactos, reject_if: :all_blank, allow_destroy: true


	validates_presence_of :nombre_fiscal, :nombre_comercial, :rfc, :codigo_postal, :telefono_oficina, :correo


	pg_search_scope :search_by_full_cliente, associated_against: { cliente_contactos: [:nombre, :appaterno] },
											against: [:nombre_comercial, :nombre_fiscal, :rfc, :codigo_postal, 
														:correo, :estado ],	
											using:   {tsearch: { prefix: true }}			  
   
end

