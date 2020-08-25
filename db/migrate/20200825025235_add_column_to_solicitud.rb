class AddColumnToSolicitud < ActiveRecord::Migration[6.0]
  def change
    add_column :solicituds, :tuberia_altura, :boolean
    add_column :solicituds, :tuberia_altura_valor, :float
  end
end
