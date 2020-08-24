class Proyecto < ApplicationRecord
	 
 	 

	validates :nombre_proyecto, presence: true
	validates :nombre_proyecto, uniqueness: true
end
