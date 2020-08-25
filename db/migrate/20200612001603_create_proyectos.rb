class CreateProyectos < ActiveRecord::Migration[5.0]
  def change
    create_table :proyectos do |t|
      t.string :nombre_proyecto
      t.string :empresa
      t.string :responsable
      t.text :comentarios

      t.timestamps
    end
  end
end
