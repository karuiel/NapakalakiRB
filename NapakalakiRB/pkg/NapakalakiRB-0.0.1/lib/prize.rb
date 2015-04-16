#encoding: utf-8
module Model
  class Prize

    attr_reader :treasures, :levels

    def initialize(t,l)
      if t > 0
        @treasures = t
      else 
        @treasures = 0
      end

      if l > 0
        @levels = l
      else 
        @levels = 0
      end  
    end

    def to_s
      "Tesoros ganados: #{@treasures} \n Niveles ganados: #{@levels}"
    end
  end
end