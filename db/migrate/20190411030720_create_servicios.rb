class CreateServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :servicios do |t|
      t.text :concepto
      t.float :cantidad
      t.float :precio_a
      t.float :precio_b
      t.float :precio_c
      t.string :entidad
      t.string :tipo_servicio
      t.string :material

      t.timestamps
    end
  end
end
