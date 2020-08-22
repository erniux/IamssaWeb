class PaginasController < ApplicationController

	def inicio
        @solicitud = Solicitud.where(estatus: "Emitida")
	end

	 
    
end
