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

ActiveRecord::Schema.define(version: 2020_08_22_221914) do

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id"
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
    t.float "presupuesto"
    t.float "credito"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipo"
    t.float "descuento"
    t.string "banco"
    t.string "sucursal"
    t.string "cuenta"
    t.string "clabe"
    t.string "precio"
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
  end

  create_table "cotizacion_detalles", id: :serial, force: :cascade do |t|
    t.integer "num_partida"
    t.integer "cotizacion_id"
    t.integer "servicio_id"
    t.integer "tipo_servicio_id"
    t.integer "cantidad"
    t.float "precio"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total"
    t.index ["cotizacion_id"], name: "index_cotizacion_detalles_on_cotizacion_id"
    t.index ["servicio_id"], name: "index_cotizacion_detalles_on_servicio_id"
    t.index ["tipo_servicio_id"], name: "index_cotizacion_detalles_on_tipo_servicio_id"
  end

  create_table "cotizacions", id: :serial, force: :cascade do |t|
    t.string "num_cotizacion"
    t.integer "proyecto_id"
    t.integer "cliente_id"
    t.integer "solicitud_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_cotizacions_on_cliente_id"
    t.index ["proyecto_id"], name: "index_cotizacions_on_proyecto_id"
    t.index ["solicitud_id"], name: "index_cotizacions_on_solicitud_id"
  end

  create_table "detalle_usuarios", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "NoCredencial"
    t.string "Nombre"
    t.string "Iniciales"
    t.string "Direccion"
    t.string "Colonia"
    t.string "Poblacion"
    t.string "Estado"
    t.string "CP"
    t.string "Telefono"
    t.string "Celular"
    t.string "Nextel"
    t.string "Radio"
    t.date "Nacimiento"
    t.string "Contratacion"
    t.string "Puesto"
    t.string "Depto"
    t.string "IdEntidad"
    t.string "RFC"
    t.string "CURP"
    t.string "IMSS"
    t.string "Licencia"
    t.string "Tipo"
    t.string "Exped"
    t.date "Venc"
    t.string "Licencia2"
    t.string "Tipo2"
    t.date "Exped2"
    t.string "Venc2"
    t.string "RazonSocial"
    t.string "Examinador"
    t.string "Ocupacion"
    t.string "Cedula"
    t.string "Registro"
    t.string "Agudeza"
    t.string "Jaeger"
    t.string "Colores"
    t.string "Grises"
    t.string "UltExa"
    t.string "ProxExa"
    t.string "Informar"
    t.string "Parentesco"
    t.string "TelInformar"
    t.string "GrupoSanguineo"
    t.string "AlergiaMedicamento"
    t.string "EnfCronicas"
    t.string "Activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_detalle_usuarios_on_user_id"
  end

  create_table "empleados", id: :serial, force: :cascade do |t|
    t.integer "NoCredencial"
    t.string "Nombre"
    t.string "Iniciales"
    t.string "Direccion"
    t.string "Colonia"
    t.string "Poblacion"
    t.string "Estado"
    t.string "CP"
    t.string "Telefono"
    t.string "Celular"
    t.string "Nextel"
    t.string "Radio"
    t.datetime "Nacimiento"
    t.datetime "Contratacion"
    t.string "Puesto"
    t.string "Depto"
    t.integer "IdEntidad"
    t.string "RFC"
    t.string "CURP"
    t.string "IMSS"
    t.string "Licencia"
    t.string "Tipo"
    t.datetime "Exped"
    t.datetime "Venc"
    t.string "Licencia2"
    t.string "Tipo2"
    t.datetime "Exped2"
    t.datetime "Venc2"
    t.string "RazonSocial"
    t.string "Examinador"
    t.string "Ocupacion"
    t.string "Cedula"
    t.string "Registro"
    t.string "Agudeza"
    t.boolean "Jaeger"
    t.boolean "Colores"
    t.boolean "Grises"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "Activo"
    t.datetime "ProxExa"
    t.string "Informar"
    t.string "Parentesco"
    t.string "TelInformar"
    t.string "GrupoSanguineo"
    t.string "AlergiaMedicamento"
    t.string "EnfCronicas"
    t.datetime "UltExa"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cancelada"
    t.datetime "Cancelacion"
    t.integer "IdEntidad"
    t.integer "NoCotizacion"
    t.datetime "FechaSalida"
    t.datetime "FechaRegreso"
    t.integer "IdPersonalAutoriza"
    t.integer "IdPersonal"
    t.string "Ubicacion"
    t.string "EntregarResultados"
    t.integer "IdContactoSolicita"
    t.integer "IdContactoAtiende"
    t.boolean "SegLentes"
    t.boolean "SegCasco"
    t.boolean "SegZapatos"
    t.boolean "SegArnes"
    t.boolean "SegTaponesAuditivos"
    t.boolean "SegIMSS"
    t.string "Obra"
    t.integer "IdEntidadDpto"
    t.integer "IdCiudad"
    t.string "Unidad"
    t.integer "NoOTOrigen"
    t.integer "IdObra"
    t.boolean "EntregarBorrador"
    t.boolean "EntregarPeliculas"
    t.text "observaciones"
    t.datetime "start"
    t.datetime "end"
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
    t.string "entidad"
    t.string "tipo_servicio"
    t.string "material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solicitud_estructuras", id: :serial, force: :cascade do |t|
    t.integer "solicitud_id"
    t.boolean "estructura", default: false
    t.boolean "columna_pr", default: false
    t.boolean "columna_hss_o_cajon", default: false
    t.boolean "columna_ptr_o_monten", default: false
    t.boolean "trabes_pr", default: false
    t.boolean "trabes_ps", default: false
    t.boolean "trabes_angulo_con_ptr", default: false
    t.boolean "angulo_con_angulo", default: false
    t.boolean "ptr_con_ptr", default: false
    t.boolean "union_filete", default: false
    t.boolean "union_a_tope", default: false
    t.float "espesor_columna"
    t.float "espesor_trabe"
    t.float "tiempo_fabricacion_montaje"
    t.float "toneladas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solicitud_id"], name: "index_solicitud_estructuras_on_solicitud_id"
  end

  create_table "solicitud_servicios", id: :serial, force: :cascade do |t|
    t.integer "solicitud_id", null: false
    t.boolean "torque", null: false
    t.boolean "vacio", null: false
    t.boolean "iris", null: false
    t.boolean "prueba_doblez", null: false
    t.boolean "prueba_pintura", null: false
    t.boolean "doblez", null: false
    t.boolean "radiografia", null: false
    t.boolean "inspeccion_visual", null: false
    t.boolean "ultrasonido", null: false
    t.boolean "liquido_penetrante", null: false
    t.boolean "part_magneticas", null: false
    t.boolean "supervicion", null: false
    t.boolean "calif_soldador", null: false
    t.boolean "calif_procedimiento", null: false
    t.boolean "elab_procedimiento", null: false
    t.boolean "emision_procedimiento", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solicitud_id"], name: "index_solicitud_servicios_on_solicitud_id"
  end

  create_table "solicitud_tanques", id: :serial, force: :cascade do |t|
    t.integer "solicitud_id"
    t.boolean "tanque", default: false
    t.boolean "recipiente_a_presion"
    t.float "espesor_cuerpo"
    t.float "espesor_tapa"
    t.float "espesor_diametro"
    t.float "espesor_capacidad"
    t.float "espesor_longitud_altura"
    t.float "no_sold_circunferencia"
    t.float "no_sold_longitud"
    t.float "codigo_evaluacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solicitud_id"], name: "index_solicitud_tanques_on_solicitud_id"
  end

  create_table "solicitud_tuberia", id: :serial, force: :cascade do |t|
    t.integer "solicitud_id"
    t.float "recipiente_a_presion"
    t.float "espesor_cuerpo"
    t.float "tanque"
    t.float "espesor_tapa"
    t.float "espesor_diametro"
    t.float "espesor_capacidad"
    t.float "espesor_longitud_altura"
    t.float "no_sold_circunferencia"
    t.float "no_sold_longitud"
    t.string "codigo_evaluacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tuberia"
    t.index ["solicitud_id"], name: "index_solicitud_tuberia_on_solicitud_id"
  end

  create_table "solicituds", id: :serial, force: :cascade do |t|
    t.string "proyecto"
    t.string "estatus"
    t.text "comentarios"
    t.integer "user_id"
    t.integer "cliente_id"
    t.integer "cliente_contacto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.float "tuberia_uniones_hasta_2_y_medio"
    t.float "tuberia_uniones_3_a_8"
    t.float "tuberia_uniones_10_a_14"
    t.float "tuberia_uniones_16_a_20"
    t.float "tuberia_uniones_24_a_26"
    t.float "tuberia_uniones_30_a_32"
    t.float "tuberia_uniones_34_a_36"
    t.float "tuberia_uniones_38_a_42"
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
    t.float "tuberia_altura_valor"
    t.boolean "tuberia_altura"
    t.string "tuberia_codigo_evaluacion"
    t.string "nombre_contacto"
    t.string "telefono_directo"
    t.string "correo"
    t.string "puesto"
    t.string "departamento"
    t.bigint "proyecto_id"
    t.index ["cliente_contacto_id"], name: "index_solicituds_on_cliente_contacto_id"
    t.index ["cliente_id"], name: "index_solicituds_on_cliente_id"
    t.index ["proyecto_id"], name: "index_solicituds_on_proyecto_id"
    t.index ["user_id"], name: "index_solicituds_on_user_id"
  end

  create_table "tipo_servicios", id: :serial, force: :cascade do |t|
    t.string "cve_tipo_servicio"
    t.string "detalle_servicio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  add_foreign_key "cotizacion_detalles", "tipo_servicios"
  add_foreign_key "cotizacions", "clientes"
  add_foreign_key "cotizacions", "proyectos"
  add_foreign_key "cotizacions", "solicituds"
  add_foreign_key "detalle_usuarios", "users"
  add_foreign_key "solicitud_estructuras", "solicituds"
  add_foreign_key "solicitud_servicios", "solicituds"
  add_foreign_key "solicitud_tanques", "solicituds"
  add_foreign_key "solicitud_tuberia", "solicituds"
  add_foreign_key "solicituds", "cliente_contactos"
  add_foreign_key "solicituds", "clientes"
  add_foreign_key "solicituds", "proyectos"
  add_foreign_key "solicituds", "users"
end
