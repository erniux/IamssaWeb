class ProyectosController < ApplicationController

	def index
		@proyectos = Proyecto.all
	end 

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
		params.require(:proyecto).permit(:id, :nombre_proyecto, :empresa, :responsable, :comentarios)
	end
end
