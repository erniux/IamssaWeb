class CotizacionsController < ApplicationController
  before_action :set_cotizacion, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all


  def index
    if params[:term].present?
      @cotizacions = Cotizacion.search_by_full_cotizacion(params[:term]).order(id: 'ASC').page(params[:page])
    elsif  
      @cotizacions = Cotizacion.order(:id).page(params[:page])
    end 
  end

  def show
  end

  def new
    @cotizacion = Cotizacion.new
  end

 
  def edit
  end

  
  def create
    @cotizacion = Cotizacion.new(cotizacion_params)

    if @cotizacion.save
      redirect_to cotizacions_path, notice: 'Registro creado con éxito.'
    else
      render :new
    end
  end

   
  def update
    if @cotizacion.update(cotizacion_params)
      redirect_to cotizacions_path, notice: 'Registro actualizado con éxito.'
    else
      render :edit
    end
  end

   
  def destroy
    @cotizacion.destroy
    redirect_to cotizacions_url, notice: 'Registro eliminado con éxito.'
  end

  private
     
    def set_cotizacion
      @cotizacion = Cotizacion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cotizacion_params
      params.require(:cotizacion).permit(:num_cotizacion, :solicitud_id, :total, :impuesto, :descuento, :gran_total, 
                        cotizacion_detalles_attributes: [:id, :num_partida,:cantidad,:precio,:observaciones,
                                                         :cotizacion_id,:servicio_id, :_destroy])
    end
end
