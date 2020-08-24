class ProyectosController < ApplicationController

	def create
		@proyecto = Proyecto.new(proyecto_params)
		if @proyecto.save
			render json: @proyecto, status: :created
		else
			render json: @proyecto.errors.full_messages, status: :unprocessable_entity
		end
	end

	private 

	def proyecto_params
		params.require(:proyecto).permit(:id, :nombre_proyecto)
	end
end
