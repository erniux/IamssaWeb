class ClienteContactosController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :set_cliente_contacto, only: [:show, :edit, :update, :destroy]

  def index
    @cliente_contactos = ClienteContacto.all
  end

  def show
  end

  def new
    #@cliente_contacto = ClienteContacto.new
  end

  def edit
  end

  def create
     @cliente = Cliente.find(params[:cliente_id])
     @cliente_contacto = @cliente.cliente_contactos.create(cliente_contacto_params)
     redirect_to edit_cliente_path(@cliente)
     @cliente_contacto = ClienteContacto.new(cliente_contacto_params)
  end

  def update
    respond_to do |format|
      if @cliente_contacto.update(cliente_contacto_params)
        format.html { redirect_to edit_cliente_path(@cliente), notice: 'registro actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @cliente_contacto }
      else
        format.html { render :edit }
        format.json { render json: @cliente_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #if @cliente_contacto.present?
        @cliente_contacto.destroy
    #end
      respond_to do |format|
        format.html { redirect_to edit_cliente_path(@cliente), notice: 'Registro eliminado con éxito.' }
        format.json { head :no_content }

    end
  end

  private

    def set_cliente
      @cliente = Cliente.find(params[:cliente_id])
    end

    def set_cliente_contacto
      @cliente_contacto = @cliente.cliente_contactos.find(params[:id])
    end

    def cliente_contacto_params
      params.require(:cliente_contacto).permit(:nombre, :appaterno, :apmaterno, :telefono_directo, :correo, :puesto, :departamento, :clientes_id)
    end

end
