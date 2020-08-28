class AddColumnCotizacions < ActiveRecord::Migration[6.0]
  def change
  	    add_column :cotizacions, :total, :float
  	    add_column :cotizacions, :impuesto, :float
  	    add_column :cotizacions, :descuento, :float
  	    add_column :cotizacions, :gran_total, :float

  end
end
