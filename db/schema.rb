# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_28_021418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cliente_contactos", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "appaterno"
    t.string "apmaterno"
    t.string "telefono_directo"
    t.string "correo"
    t.string "puesto"
    t.string "departamento"
    t.integer "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_cliente_contactos_on_cliente_id"
  end

  create_table "clientes", id: :serial, force: :cascade do |t|
    t.string "nombre_fiscal"
    t.string "nombre_comercial"
    t.string "rfc"
    t.string "calle_numero"
    t.string "colonia"
    t.string "poblacion"
    t.string "estado"
    t.integer "codigo_postal"
    t.string "telefono_oficina"
    t.string "telefono_celular"
    t.string "telefono_directro"
    t.string "correo"
    t.string "medio_contacto"
    t.string "precio"
    t.float "presupuesto"
    t.float "credito"
    t.integer "revision_lunes"
    t.integer "revision_martes"
    t.integer "revision_miercoles"
    t.integer "revision_jueves"
    t.integer "revision_viernes"
    t.integer "revision_sabado"
    t.integer "cobro_lunes"
    t.integer "cobro_martes"
    t.integer "cobro_miercoles"
    t.integer "cobro_jueves"
    t.integer "cobro_viernes"
    t.integer "cobro_sabado"
    t.float "descuento"
    t.string "banco"
    t.string "sucursal"
    t.string "cuenta"
    t.string "clabe"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cotizacion_detalles", force: :cascade do |t|
    t.integer "num_partida"
    t.float "cantidad"
    t.float "precio"
    t.text "observaciones"
    t.bigint "cotizacion_id", null: false
    t.bigint "servicio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cotizacion_id"], name: "index_cotizacion_detalles_on_cotizacion_id"
    t.index ["servicio_id"], name: "index_cotizacion_detalles_on_servicio_id"
  end

  create_table "cotizacions", force: :cascade do |t|
    t.string "num_cotizacion"
    t.bigint "solicitud_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "total"
    t.float "impuesto"
    t.float "descuento"
    t.float "gran_total"
    t.index ["solicitud_id"], name: "index_cotizacions_on_solicitud_id"
  end

  create_table "proyectos", id: :serial, force: :cascade do |t|
    t.string "nombre_proyecto"
    t.string "empresa"
    t.string "responsable"
    t.text "comentarios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicios", id: :serial, force: :cascade do |t|
    t.text "concepto"
    t.float "cantidad"
    t.float "precio_a"
    t.float "precio_b"
    t.float "precio_c"
    t.string "material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tipo_servicio_id"
    t.index ["tipo_servicio_id"], name: "index_servicios_on_tipo_servicio_id"
  end

  create_table "solicituds", id: :serial, force: :cascade do |t|
    t.string "proyecto"
    t.string "estatus"
    t.text "comentarios"
    t.boolean "estructura_columna_pr"
    t.boolean "estructura_columna_hss_o_cajon"
    t.boolean "estructura_columna_ptr_o_monten"
    t.boolean "estructura_trabes_pr"
    t.boolean "estructura_trabes_ps"
    t.boolean "estructura_trabes_angulo_con_ptr"
    t.boolean "estructura_angulo_con_angulo"
    t.boolean "estructura_ptr_con_ptr"
    t.boolean "estructura_union_filete"
    t.boolean "estructura_union_a_tope"
    t.float "estructura_espesor_columna"
    t.float "estructura_espesor_trabe"
    t.float "estructura_tiempo_fabricacion_montaje"
    t.float "estructura_toneladas"
    t.boolean "servicio_torque"
    t.boolean "servicio_vacio"
    t.boolean "servicio_iris"
    t.boolean "servicio_prueba_doblez"
    t.boolean "servicio_prueba_pintura"
    t.boolean "servicio_doblez"
    t.boolean "servicio_radiografia"
    t.boolean "servicio_inspeccion_visual"
    t.boolean "servicio_ultrasonido"
    t.boolean "servicio_liquido_penetrante"
    t.boolean "servicio_part_magneticas"
    t.boolean "servicio_supervicion"
    t.boolean "servicio_calif_soldador"
    t.boolean "servicio_calif_procedimiento"
    t.boolean "servicio_elab_procedimiento"
    t.boolean "servicio_emision_procedimiento"
    t.boolean "tanque_recipiente_a_presion"
    t.float "tanque_espesor_cuerpo"
    t.float "tanque_espesor_tapa"
    t.float "tanque_espesor_diametro"
    t.float "tanque_espesor_capacidad"
    t.float "tanque_espesor_longitud_altura"
    t.float "tanque_no_sold_circunferencia"
    t.float "tanque_no_sold_longitud"
    t.float "tanque_codigo_evaluacion"
    t.float "tuberia_tanque"
    t.float "tuberia_uniones_hasta_2_y_medio"
    t.float "tuberia_uniones_3_a_8"
    t.float "tuberia_uniones_10_a_14"
    t.float "tuberia_uniones_16_a_20"
    t.float "tuberia_uniones_24_a_26"
    t.float "tuberia_uniones_30_a_32"
    t.float "tuberia_uniones_34_a_36"
    t.float "tuberia_uniones_38_a_42"
    t.string "tuberia_codigo_evaluacion"
    t.float "tuberia_uniones_44_a_48"
    t.float "tuberia_cedula_hasta_2_y_medio"
    t.float "tuberia_cedula_3_a_8"
    t.float "tuberia_cedula_10_a_14"
    t.float "tuberia_cedula_16_a_20"
    t.float "tuberia_cedula_24_a_26"
    t.float "tuberia_cedula_30_a_32"
    t.float "tuberia_cedula_34_a_36"
    t.float "tuberia_cedula_38_a_42"
    t.float "tuberia_cedula_44_a_48"
    t.integer "user_id"
    t.integer "cliente_id"
    t.integer "cliente_contacto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "proyecto_id"
    t.boolean "tuberia_altura"
    t.float "tuberia_altura_valor"
    t.index ["cliente_contacto_id"], name: "index_solicituds_on_cliente_contacto_id"
    t.index ["cliente_id"], name: "index_solicituds_on_cliente_id"
    t.index ["proyecto_id"], name: "index_solicituds_on_proyecto_id"
    t.index ["user_id"], name: "index_solicituds_on_user_id"
  end

  create_table "tipo_servicios", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "clave"
    t.string "descripcion"
    t.string "tbl"
    t.string "frm"
    t.string "frmservicio"
    t.string "reportes"
    t.integer "aprox"
    t.integer "cant_condiciones"
    t.integer "capacidad_instalada"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cliente_contactos", "clientes"
  add_foreign_key "cotizacion_detalles", "cotizacions"
  add_foreign_key "cotizacion_detalles", "servicios"
  add_foreign_key "cotizacions", "solicituds"
  add_foreign_key "servicios", "tipo_servicios"
  add_foreign_key "solicituds", "cliente_contactos"
  add_foreign_key "solicituds", "clientes"
  add_foreign_key "solicituds", "proyectos"
  add_foreign_key "solicituds", "users"
end
