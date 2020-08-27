class CotizacionDetalle < ApplicationRecord
  belongs_to :cotizacion
  belongs_to :servicio
end
