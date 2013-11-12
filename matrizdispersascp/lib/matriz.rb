# Practica 8 Lenguajes y Paradigmas de la programación usando #desarrollo dirigido por pruebas (Test Driven Development - TDD) con 
# la herramienta Rspec.
# Pedro Javier Núñez Rodríguez
# Constanza Leon Baritussio
# 

class Matriz
  
   include Comparable 		#Modulo comparable
   attr_accessor :matrix, :n, :m
   @matrix
   @n   # filas
   @m   # columnas
	
   def initialize(n,m) 		#Constructor de la clase que inicializa la matriz con los valores que se le pasan por parametros
      raise ArgumentError, 'Tamaño de matriz no valido' unless n.is_a? Integer and m.is_a? Integer and n > 0 and m > 0
	  @n = n 
	  @m = m
      @matrix=[]
      for i in (0...@n) 
         @matrix[i]=[]
         for j in (0...@m)
            @matrix[i][j] = 0
         end
      end
   end
 
   def set(i, j, valor)		#Método para aaceder a los valores i , j y valor de la matriz
      raise ArgumentError, 'Indice no valido' unless i.is_a? Integer and i >= 0 and i < @n
      raise ArgumentError, 'Indice no valido' unless j.is_a? Integer and j >= 0 and j < @m
      raise ArgumentError, 'Valor no numerico' unless valor.is_a? Integer 
      @matrix[i][j] = valor
   end
 
   def get(i, j)
      return @matrix[i][j]
   end
     
   def to_s			#Método encargado de mostrar por consola la matriz de forma matriz[i][j]		
	  s = ""
	  s += "{"
      for i in (0...n)
         s += "{"
         for j in (0...m)
            if j == 0
               s += "#{matrix[i][j]}"
            else
               s += ","
               s += "#{matrix[i][j]}"
            end
         end
         s += "}"
      end
      s += "}"
      s
   end
  
   def to_f			# Método encargado de mostrar por  la consola la matriz en formato flotante
      s = ""
	  s = "{"
      for i in (0...n)
         s += "{"
         for j in (0...m)
            if j == 0
               s += "#{matrix[i][j].to_f}"
            else
               s += ","
               s += "#{matrix[i][j].to_f}"
            end
         end
         s += "}"
      end
      s += "}"
      s
   end
   
   def -@			# Sobrecarga del operador - para calcular el opuesto de una matriz
	  mat = Matriz.new(n,m)
      for i in (0...n) 
         for j in (0...m)
            if matrix[i][j] != 0
               mat.matrix[i][j] = (matrix[i][j] * -1)
            end
         end
      end
      mat
   end
   
   def * num			#Método que multiplica un número por una matriz
      mat = Matriz.new(n,m)
      for i in (0...n)
         for j in (0...m)
            mat.set(i,j,matrix[i][j] * num)
         end
      end
      mat
   end
   
   def + matAux			#Método para hacer la suma de de matrices
      mat = Matriz.new(n,m)
      for i in (0...n)
         for j in (0...m)
            mat.set(i,j,matrix[i][j] + matAux.matrix[i][j])
         end
      end
      mat
   end
   
   def - matAux			#Método para hacer la resta de  matrices
      mat = Matriz.new(n,m)
      for i in (0...n)
         for j in (0...m)
            mat.set(i,j,matrix[i][j] - matAux.matrix[i][j])
         end
      end
      mat
   end
   
  def * matAux			#Método para hacer la multiplicacion de matrices
      mat = Matriz.new(n,m)	
      for k in 0...n
	    for i in (0...n)
	       contador = 0
               for j in (0...m)
		  contador = contador +(self.get(i,j) * matAux.get(i,j))
		end
            end
         mat.set(i,j, contador)
     end
     mat
 end

end


