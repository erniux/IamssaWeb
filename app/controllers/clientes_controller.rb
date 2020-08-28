class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  access user: :all, site_admin: :all

  def index
    if params[:term].present?
      @clientes = Cliente.search_by_full_cliente(params[:term]).order(nombre_fiscal: 'ASC').page(params[:page])
    elsif  
      @clientes = Cliente.order(:nombre_fiscal).order(nombre_fiscal: 'ASC').page(params[:page])
    end 
  end


  def show
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      redirect_to edit_cliente_path(@cliente), notice: 'Registro guardado con éxito.'
    else
      render :new
    end
  end

  def update
    if @cliente.update(cliente_params)
      redirect_to @cliente, notice: 'Registro guardado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    if @cliente.cliente_contactos.any?
      redirect_to clientes_url, notice: 'No es posible eliminar el registro, ya que tiene solicitudes y/o contactos asociados.'
    else
      @cliente.destroy
      redirect_to clientes_url, notice: 'Registro eliminado con éxito.'
    end
  end

  private
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    def cliente_params
      params.require(:cliente).permit(:id, :nombre_fiscal, :nombre_comercial, :string, :rfc, 
                                      :calle_numero, :colonia, :poblacion, :estado, :codigo_postal, :telefono_oficina, 
                                      :telefono_celular, :telefono_directro, :correo, :medio_contacto, :precio, :presupuesto, 
                                      :credito, :revision_lunes, :revision_martes, :revision_miercoles, :revision_jueves, 
                                      :revision_viernes, :revision_sabado, :cobro_lunes, :cobro_martes, :cobro_miercoles, 
                                      :cobro_jueves, :cobro_viernes, :cobro_sabado, :tipo, :descuento, 
                                      :banco, :sucursal, :cuenta, :clabe,
          cliente_contactos_attributes: [:id, :nombre, :appaterno, :apmaterno, :telefono_directo, :correo, :puesto,
                                         :departamento, :_destroy])
    end
end
