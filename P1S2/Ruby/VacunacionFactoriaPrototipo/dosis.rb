require 'securerandom'

module Vacunacion
  class Dosis

    attr_accessor :serie

    def initialize
      @serie = SecureRandom.uuid
    end

    def clonar()
      #Copia profunda en ruby
      Marshal.load(Marshal.dump(self))
    end
  end
end