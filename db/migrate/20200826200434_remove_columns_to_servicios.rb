class RemoveColumnsToServicios < ActiveRecord::Migration[6.0]
  def change
  	remove_column :servicios, :tipo_servicio
  	remove_column :servicios, :entidad
  	remove_column :tipo_servicios, :cve_tipo_servicio
	remove_column :tipo_servicios, :detalle_servicio
  end
end
