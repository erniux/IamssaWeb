class AddReferenceToServicios < ActiveRecord::Migration[6.0]
  def change
    add_reference :servicios, :tipo_servicio, foreign_key: true
     
  end
end
