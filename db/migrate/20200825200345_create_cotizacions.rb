class CreateCotizacions < ActiveRecord::Migration[6.0]
  def change
    create_table :cotizacions do |t|
      t.string :num_cotizacion
      t.references :solicitud, null: false, foreign_key: true

      t.timestamps
    end
  end
end
      