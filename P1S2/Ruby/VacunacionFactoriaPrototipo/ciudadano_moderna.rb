#encoding: UTF-8

require_relative 'ciudadano'

module Vacunacion
  class CiudadanoModerna < Ciudadano
    def initialize
      super
      @dni = rand(100000000..999999999)
      @edad = rand(50..111)
    end

    def toString
      puts("Mi DNI es #{@dni}, tengo #{@edad} y me he vacunado de Moderna :D")
    end
  end
end