require_relative 'vacunacion_factory'

module Vacunacion
  class VacunacionPrototipoFactory < VacunacionFactory
    def initialize(dosis, ciudadano)
      @dosis_prototipo = dosis
      @ciudadano_prototipo = ciudadano
    end

    def crearDosis
      puts("Clonando dosis...")
      return @dosis_prototipo.clonar()
    end

    def crearCiudadano
      puts("Clonando ciudadano...")
      return @ciudadano_prototipo.clonar()
    end
  end
end