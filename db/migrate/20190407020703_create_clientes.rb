class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nombre_fiscal
      t.string :nombre_comercial
      t.string :rfc
      t.string :calle_numero
      t.string :colonia
      t.string :poblacion
      t.string :estado
      t.integer :codigo_postal
      t.string :telefono_oficina
      t.string :telefono_celular
      t.string :telefono_directro
      t.string :correo
      t.string :medio_contacto
      t.string :precio
      t.float :presupuesto
      t.float :credito
      t.integer :revision_lunes
      t.integer :revision_martes
      t.integer :revision_miercoles
      t.integer :revision_jueves
      t.integer :revision_viernes
      t.integer :revision_sabado
      t.integer :cobro_lunes
      t.integer :cobro_martes
      t.integer :cobro_miercoles
      t.integer :cobro_jueves
      t.integer :cobro_viernes
      t.integer :cobro_sabado
      t.float  :descuento
      t.string  :banco
      t.string  :sucursal
      t.string  :cuenta
      t.string  :clabe
      t.string  :tipo

      t.timestamps
    end
  end
end
