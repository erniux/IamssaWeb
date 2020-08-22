class SolicitudsController < ApplicationController
  before_action :set_solicitud, only: [:show, :edit, :update, :destroy]
  access user: :all, site_admin: :all

  def index
    if params[:term].present?
      @solicituds = Solicitud.search_by_full_solicitud(params[:term]).order(id: 'DESC').page(params[:page])
    elsif  
      @solicituds = Solicitud.order(id: 'DESC').page(params[:page])
    end

  end

  def show
  end

  def new
    @solicitud = Solicitud.new
  end

  def edit
  end

  def create
    @solicitud = Solicitud.new(solicitud_params)

    if @solicitud.save
      redirect_to @solicitud, notice: 'Registro creado correctamente.'
    else
      render :new
    end
  end

  def update
    if @solicitud.update(solicitud_params)
      redirect_to @solicitud, notice: 'Registro actualizado correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @solicitud.destroy
    redirect_to solicituds_url, notice: 'Registro eliminado correctamente.'
  end

  private

    def set_solicitud
      @solicitud = Solicitud.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def solicitud_params
      params.require(:solicitud).permit(:proyecto, :estatus, :comentarios, :user_id, :cliente_id, :cliente_contacto_id, 
        :estructura_columna_pr, :estructura_columna_hss_o_cajon, :estructura_columna_ptr_o_monten, :estructura_trabes_pr, 
        :estructura_trabes_ps, :estructura_trabes_angulo_con_ptr, :estructura_angulo_con_angulo, :estructura_ptr_con_ptr, 
        :estructura_union_filete, :estructura_union_a_tope, :estructura_espesor_columna, :estructura_espesor_trabe, 
        :estructura_tiempo_fabricacion_montaje, :estructura_toneladas, :servicio_torque, :servicio_vacio, :servicio_iris, 
        :servicio_prueba_doblez, :servicio_prueba_pintura, :servicio_doblez, :servicio_radiografia, :servicio_inspeccion_visual, 
        :servicio_ultrasonido, :servicio_liquido_penetrante, :servicio_part_magneticas, :servicio_supervicion, 
        :servicio_calif_soldador, :servicio_calif_procedimiento, :servicio_elab_procedimiento, :servicio_emision_procedimiento, 
        :tanque_recipiente_a_presion, :tanque_espesor_cuerpo, :tanque_espesor_tapa, :tanque_espesor_diametro, 
        :tanque_espesor_capacidad, :tanque_espesor_longitud_altura, :tanque_no_sold_circunferencia, :tanque_no_sold_longitud, 
        :tanque_codigo_evaluacion, :tuberia_altura, :tuberia_altura_valor, :tuberia_uniones_hasta_2_y_medio, :tuberia_uniones_3_a_8, 
        :tuberia_uniones_10_a_14, :tuberia_uniones_16_a_20, :tuberia_uniones_24_a_26, :tuberia_uniones_30_a_32, :tuberia_uniones_34_a_36, 
        :tuberia_uniones_38_a_42, :tuberia_uniones_44_a_48, :tuberia_cedula_hasta_2_y_medio, :tuberia_cedula_3_a_8, :tuberia_cedula_10_a_14, 
        :tuberia_cedula_16_a_20, :tuberia_cedula_24_a_26, :tuberia_cedula_30_a_32, :tuberia_cedula_34_a_36, :tuberia_cedula_38_a_42, 
        :tuberia_cedula_44_a_48, :tuberia_codigo_evaluacion, :nombre_contacto, :telefono_directo, :correo, :puesto, :departamento)
    end
end




