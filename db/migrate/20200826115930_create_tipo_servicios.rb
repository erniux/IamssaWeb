class CreateTipoServicios < ActiveRecord::Migration[6.0]
  def change
      add_column :tipo_servicios, :clave, :string
      add_column :tipo_servicios, :descripcion, :string
      add_column :tipo_servicios, :tbl, :string
      add_column :tipo_servicios, :frm, :string
      add_column :tipo_servicios, :frmservicio, :string
      add_column :tipo_servicios, :reportes, :string
      add_column :tipo_servicios, :aprox, :integer
      add_column :tipo_servicios, :cant_condiciones, :integer
      add_column :tipo_servicios, :capacidad_instalada, :integer

  end
end

 