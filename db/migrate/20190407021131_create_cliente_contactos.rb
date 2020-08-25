class CreateClienteContactos < ActiveRecord::Migration[5.0]
  def change
    create_table :cliente_contactos do |t|
      t.string :nombre
      t.string :appaterno
      t.string :apmaterno
      t.string :telefono_directo
      t.string :correo
      t.string :puesto
      t.string :departamento
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
