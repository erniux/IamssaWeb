class Servicio < ApplicationRecord
	include PgSearch::Model

	belongs_to :tipo_servicio

	validates_presence_of :concepto, :cantidad, :precio_a, :precio_b, :precio_c
	validates_uniqueness_of :concepto

end

  