#require "Matrizdispersascp/version"
require "matriz"
require "fraccion"

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
	
	class MatrizDispersa < Matriz
	
	end
		
end
