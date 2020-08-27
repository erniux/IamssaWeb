class ServiciosController < ApplicationController
  before_action :set_servicio, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  def index 
    @servicios = Servicio.all
  end 
     
  

  def show
  end

  def new
    @servicio = Servicio.new
  end

  def edit
  end

  def create
    @servicio = Servicio.new(tipo_servicio_params)

    if @servicio.save
      redirect_to servicios_path, notice: 'Registro creado con éxito.'
    else
      render :new
    end
  end

  def update
    if @servicio.update(servicio_params)
      redirect_to servicios_path, notice: 'Registro actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @servicio.destroy
    redirect_to servicios_url, notice: 'Registro eliminado con éxito.'
  end

  private
    def set_servicio
      @servicio = Servicio.find(params[:id])
    end

    def servicio_params
      params.require(:servicio).permit(:concepto, :cantidad, :precio_a, :precio_b, :precio_c, :material, :tipo_servicio_id)
    end
end
 
   
