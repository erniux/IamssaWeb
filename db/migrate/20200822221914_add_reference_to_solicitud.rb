class AddReferenceToSolicitud < ActiveRecord::Migration[6.0]
  def change
    add_reference :solicituds, :proyecto, foreign_key: true
  end
end
