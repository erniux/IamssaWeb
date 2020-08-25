class CreateTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_servicios do |t|
      t.string :cve_tipo_servicio
      t.string :detalle_servicio

      t.timestamps
    end
  end
end
