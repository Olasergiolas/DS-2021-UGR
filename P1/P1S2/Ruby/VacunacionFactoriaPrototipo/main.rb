#encoding: UTF-8

require 'securerandom'
require_relative 'dosis_moderna'
require_relative 'dosis_pfizer'
require_relative 'ciudadano_moderna'
require_relative 'ciudadano_pfizer'
require_relative 'vacunacion_prototipo_factory'

module Vacunacion
  class Cliente
    def initialize
      @factoria
      @ciudadanos = []
      @dosis = []
    end

    def procesoVacunacionModerna
      puts ("Comenzando proceso vacunación Moderna")
      puts("")

      dosis = DosisModerna.new
      ciudadano = CiudadanoModerna.new
      @factoria = VacunacionPrototipoFactory.new(dosis, ciudadano)

      for i in (0..5)
        dosis = @factoria.crearDosis
        dosis.serie = SecureRandom.uuid
        puts("Clonada dosis Moderna con serial #{dosis.serie}")
        @dosis << dosis

        ciudadano = @factoria.crearCiudadano
        ciudadano.dni = rand(100000000..999999999)
        ciudadano.edad = rand(50..111)
        puts("Clonado ciudadano Moderna con dni #{ciudadano.dni} y edad #{ciudadano.edad}")
        puts("")
        @ciudadanos << ciudadano
      end

      puts ("Finalizado proceso vacunación Moderna")
      puts("")
    end

    def procesoVacunacionPfizer
      puts ("Comenzando proceso vacunación Pfizer")
      puts("")

      dosis = DosisPfizer.new
      ciudadano = CiudadanoPfizer.new
      @factoria = VacunacionPrototipoFactory.new(dosis, ciudadano)

      for i in (0..5)
        dosis = @factoria.crearDosis
        dosis.serie = SecureRandom.uuid
        puts("Clonada dosis Pfizer con serial #{dosis.serie}")
        @dosis << dosis

        ciudadano = @factoria.crearCiudadano
        ciudadano.dni = rand(100000000..999999999)
        ciudadano.edad = rand(50..111)
        puts("Clonado ciudadano Pfizer con dni #{ciudadano.dni} y edad #{ciudadano.edad}")
        puts("")
        @ciudadanos << ciudadano
      end

      puts ("Finalizado proceso vacunación Pfizer")
      puts("")
    end

    def main
      procesoVacunacionModerna
      procesoVacunacionPfizer
    end
  end

  cliente = Cliente.new
  cliente.main
end
