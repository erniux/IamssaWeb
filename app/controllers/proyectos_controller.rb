class ProyectosController < ApplicationController
	before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

	def index
		if params[:term].present?
      		@proyectos = Proyecto.search_by_full_proyecto(params[:term]).order(nombre_proyecto: 'ASC').page(params[:page])
    	elsif  
      		@proyectos = Proyecto.order(:nombre_proyecto).order(nombre_proyecto: 'ASC').page(params[:page])
    	end 
	end 

	def show
  	end

  	def new
    	@proyecto = Proyecto.new
  	end

  	def edit
  	end
      
	def create
		@proyecto = Proyecto.new(proyecto_params)
		if @proyecto.save
			render json: @proyecto, status: :created
			redirect_to tipo_servicios_path, notice: 'Registro creado con éxito.'
		else
			render :new
			render json: @proyecto.errors.full_messages, status: :unprocessable_entity
		end
	end

	def update
    	if @proyecto.update(proyecto_params)
      		redirect_to proyectos_path, notice: 'Registro actualizado con éxito.'
    	else
      		render :edit
    	end

  	end

  	def destroy
    	@proyecto.destroy
    	redirect_to proyectos_url, notice: 'Registro eliminado con éxito.'
  	end

	private 

	def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

	def proyecto_params
		params.require(:proyecto).permit(:id, :nombre_proyecto, :empresa, :responsable, :comentarios)
	end


end
