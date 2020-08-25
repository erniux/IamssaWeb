class CreateSolicituds < ActiveRecord::Migration[5.0]
  def change
    create_table :solicituds do |t|
      t.string :proyecto
      t.string :estatus
      t.text :comentarios
      t.boolean  :estructura_columna_pr
      t.boolean  :estructura_columna_hss_o_cajon
      t.boolean  :estructura_columna_ptr_o_monten
      t.boolean  :estructura_trabes_pr
      t.boolean  :estructura_trabes_ps
      t.boolean  :estructura_trabes_angulo_con_ptr
      t.boolean  :estructura_angulo_con_angulo
      t.boolean  :estructura_ptr_con_ptr
      t.boolean  :estructura_union_filete
      t.boolean  :estructura_union_a_tope
      t.float    :estructura_espesor_columna
      t.float    :estructura_espesor_trabe
      t.float    :estructura_tiempo_fabricacion_montaje
      t.float    :estructura_toneladas
      t.boolean  :servicio_torque
      t.boolean  :servicio_vacio
      t.boolean  :servicio_iris
      t.boolean  :servicio_prueba_doblez
      t.boolean  :servicio_prueba_pintura
      t.boolean  :servicio_doblez
      t.boolean  :servicio_radiografia
      t.boolean  :servicio_inspeccion_visual
      t.boolean  :servicio_ultrasonido
      t.boolean  :servicio_liquido_penetrante
      t.boolean  :servicio_part_magneticas
      t.boolean  :servicio_supervicion
      t.boolean  :servicio_calif_soldador
      t.boolean  :servicio_calif_procedimiento
      t.boolean  :servicio_elab_procedimiento
      t.boolean  :servicio_emision_procedimiento
      t.boolean  :tanque_recipiente_a_presion
      t.float    :tanque_espesor_cuerpo
      t.float    :tanque_espesor_tapa
      t.float    :tanque_espesor_diametro
      t.float    :tanque_espesor_capacidad
      t.float    :tanque_espesor_longitud_altura
      t.float    :tanque_no_sold_circunferencia
      t.float    :tanque_no_sold_longitud
      t.float    :tanque_codigo_evaluacion
      t.float    :tuberia_tanque
      t.float    :tuberia_uniones_hasta_2_y_medio
      t.float    :tuberia_uniones_3_a_8
      t.float    :tuberia_uniones_10_a_14
      t.float    :tuberia_uniones_16_a_20
      t.float    :tuberia_uniones_24_a_26 
      t.float    :tuberia_uniones_30_a_32
      t.float    :tuberia_uniones_34_a_36 
      t.float    :tuberia_uniones_38_a_42
      t.string   :tuberia_codigo_evaluacion
      t.float  :tuberia_uniones_44_a_48
      t.float  :tuberia_cedula_hasta_2_y_medio
      t.float  :tuberia_cedula_3_a_8
      t.float  :tuberia_cedula_10_a_14
      t.float  :tuberia_cedula_16_a_20
      t.float  :tuberia_cedula_24_a_26
      t.float  :tuberia_cedula_30_a_32
      t.float  :tuberia_cedula_34_a_36
      t.float  :tuberia_cedula_38_a_42
      t.float  :tuberia_cedula_44_a_48
      t.references :user, foreign_key: true
      t.references :cliente, foreign_key: true
      t.references :cliente_contacto, foreign_key: true

      t.timestamps
    end
  end
end