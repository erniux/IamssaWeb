class Proyecto < ApplicationRecord
	include PgSearch::Model
	 
	validates :nombre_proyecto, presence: true
	validates :nombre_proyecto, uniqueness: true

	 pg_search_scope :search_by_full_proyecto,  against: [:nombre_proyecto ],	
											using:   {tsearch: { prefix: true }}		

end
