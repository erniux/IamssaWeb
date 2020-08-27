class CreateCotizacionDetalles < ActiveRecord::Migration[6.0]
  def change
    create_table :cotizacion_detalles do |t|
      t.integer :num_partida
      t.float :cantidad
      t.float :precio
      t.text :observaciones
      t.references :cotizacion, null: false, foreign_key: true
      t.references :servicio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
