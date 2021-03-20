module Vacunacion
  class Ciudadano

    attr_accessor :dni, :edad

    def initialize()
      @dni = nil
      @edad = nil
    end

    def clonar()
      #Copia profunda en ruby
      Marshal.load(Marshal.dump(self))
    end
  end
end