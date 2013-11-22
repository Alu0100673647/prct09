# Etsii ull grado informática
# Lenguajes y Paradigmas de la programacion
# Pedro Javier Núñez Rodríguez
# Constanza Leon Baritussio
# Clases MatrizDispersa y MatrizDensa

require 'matrizdispersascp/version'
require 'matriz'
require 'fraccion'

module Matrizdispersascp

    class MatrizDensa < Matriz
		
	    @matrix
	    @n  #filas
	    @m	#columnas
		
	def initialize(m)
	    @filas = m.size
	    @columnas = m[0].size
    	    @matriz = m;
	end
		
    end
	
    class Vectordisperso
	attr_reader :vector

        def initialize(h = {})
	    @vector = Hash.new(0)
            @vector = @vector.merge!(h)
        end

        def [](i)
            @vector[i] 
        end

        def to_s
            @vector.to_s
        end
    end

    class MatrizDispersa < Matriz

        attr_reader :matrix

        def initialize(h = {})
            @matrix = Hash.new({})
            for k in h.keys do 
                @matrix[k] = if h[k].is_a? Vectordisperso
	                         h[k]
                             else 
                                 @matrix[k] = Vectordisperso.new(h[k])
                             end
            end
        end

        def [](i)
            @matrix[i]
        end

        def col(j)
            c = {}
            for r in @matrix.keys do
                c[r] = @matrix[r].vector[j] if @matrix[r].vector.keys.include? j
                Vectordisperso.new c
            end
        end
	
        def to_s
            fil = 0
            print "{"
            while fil < filas
                col = 0
                while col < columnas
		    if matriz[fil] != nil 	# Hay datos en la fila
                        if matriz[fil].has_key?(col)  
                            print "#{matriz[fil][col].to_s}"
                        else
                            print "0"
                        end 
                    else
                        print "0"
                    end
			if (col + 1) < columnas then 
			    print ", " 
			end
                    col += 1
                end
                if (fil + 1) < filas then 
		    print ", " 
		end
            fil += 1
	    end
            print "}"
        end

        def to_f
            flotante = Array.new(matriz.size - 1)
            for i in 0...matriz.size
                # Hay datos en la fila
                if matriz[i] != nil
                    flotante[i] = Hash.new()
                    matriz[i].each do |key, value|
			flotante[i][key] = matriz[i][key].to_f
		        end
		    end
		end
            MatrizDispersa.new(flotante)
        end
    end
end
