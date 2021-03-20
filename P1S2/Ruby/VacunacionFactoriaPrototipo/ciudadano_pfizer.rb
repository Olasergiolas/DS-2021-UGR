#encoding: UTF-8

require_relative 'ciudadano'

module Vacunacion
  class CiudadanoPfizer < Ciudadano
    def initialize
      super
      @dni = rand(100000000..999999999)
      @edad = rand(15..51)
    end

    def toString
      puts("Mi DNI es #{@dni}, tengo #{@edad} y me he vacunado de Pfizer ;)")
    end
  end
end
