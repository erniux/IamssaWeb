class TipoServiciosController < ApplicationController
  before_action :set_tipo_servicio, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  def index
    if params[:term].present?
      @tipo_servicios = TipoServicio.search_by_full_tipo_servicio(params[:term]).page(params[:page])

    elsif  
      @tipo_servicios = TipoServicio.order(:id).page(params[:page])
    end 
     
  end

  def show
  end

  def new
    @tipo_servicio = TipoServicio.new
  end

  def edit
  end

  def create
    @tipo_servicio = TipoServicio.new(tipo_servicio_params)

    if @tipo_servicio.save
      redirect_to tipo_servicios_path, notice: 'Registro creado con éxito.'
    else
      render :new
    end
  end

  def update
    if @tipo_servicio.update(tipo_servicio_params)
      redirect_to tipo_servicios_path, notice: 'Registro actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @tipo_servicio.destroy
    redirect_to tipo_servicios_url, notice: 'Registro eliminado con éxito.'
  end

  private
    def set_tipo_servicio
      @tipo_servicio = TipoServicio.find(params[:id])
    end

    def tipo_servicio_params
      params.require(:tipo_servicio).permit(:clave, :descripcion, :tbl, :frm, :frmservicio, :reportes, :aprox, 
                                             :cant_condiciones, :capacidad_instalada, 
                      servicios_attributes: [:id, :concepto, :cantidad, :precio_a, :precio_b, :precio_c, :material, 
                                             :tipo_servicio_id, :_destroy])
    end
end
 
   
