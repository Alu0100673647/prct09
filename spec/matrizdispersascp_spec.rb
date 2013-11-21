# Etsii ull grado informática
# Lenguajes y Paradigmas de la programacion
# Pedro Javier Núñez Rodríguez
# Constanza Leon Baritussio
# Fichero de expectativas para las clases MatrizDensa y MatrizDispersa

require 'spec_helper'
require 'matrizdispersascp'
include Matrizdispersascp

describe "Pruebas Matrices" do
	#############################################################################
	describe "Matrices densas" do # Expectativas para la clase matrices densas
	#############################################################################
		@matrizA
		@matrizB
		before :each do

			# Matrices densas
			@matrizA = MatrizDensa.new([[1, 1], [2, 2]])
			@matrizB = MatrizDensa.new([[1, 1], [2, 2]])       
                       
		end
		
		describe "Metodos para la comprobacion de la inicialización y asignacion de valores" do
   
			it "Se inicializa correctamente la matriz " do # Comprobamos que todas las casillas estan a cero cuando se crea el objeto
				@matrizA.matriz[0][0].should == 1
				@matrizA.matriz[1][0].should == 2
			end

			it "Asignamos valores a posiciones de la matriz" do
				@matrizA[1,1] = 4
				@matrizA[0,1] = 2
				@matrizA.matriz[1][1].should == 4
				@matrizA.matriz[0][1].should == 2
			end
		end
   
		describe "Metodos para el cambio de formato a string y a flotante" do

			it "La matriz se muestra en formato string" do
				@matrizA.to_s.should == "{{1,1}{2,2}}"
			end
   
			it "La matriz se muestra en formato flotante" do
				@matrizA.to_f.should == "{{1.0,1.0}{2.0,2.0}}"
			end
		end

		describe "Metodo para la negacion" do
	  
			it "La matriz negada con el simbolo -" do
				@matrizC = -@matrizA
				@matrizC.to_s.should == "{{-1,-1}{-2,-2}}" 
			end
		end

		describe "Metodos para la comprobacion de operaciones entre matrices" do
      
			it "Se suman las matrices" do
				@matrizC = (@matrizA + @matrizB)
				@matrizC.to_s.should == "{{2,2}{4,4}}"
			end
 
			it "Se restan las matrices" do
				@matrizC = (@matrizA - @matrizB)
				@matrizC.to_s.should == "{{0,0}{0,0}}"
			end
		
			it "Se multiplican las mastrices" do
				@matrizC = (@matrizA * @matrizB)
				@matrizC.to_s.should == "{{3,3}{6,6}}"
			end
		end
   
		describe "Metodos para calcular maximos y minimos" do
	  
			it "Maximo de una matriz" do
				@matrizA.max.should == 2.0
			end
 
			it "Minimo de una matriz" do
				@matrizA.min.should == 1.0
			end
		end
	end

	###############################################################################
	describe "Matrices dispersas" do # Expectativas para la clase matrices dispersas
	###############################################################################
		@matrizA
		@matrizB
		before :each do

			# Matrices dispersas
			@matrizA = MatrizDispersa.new([nil, {2 => 4}])
			@matrizB = MatrizDispersa.new([{3 => 5}, nil])       
                       
		end
		
		describe "Metodos para la comprobacion de la inicialización y asignacion de valores" do
   
			it "Se inicializa correctamente la matriz " do # Comprobamos que todas las casillas estan a cero cuando se crea el objeto
				@matrizA[0,0].should == nil
				@matrizA[1,1].should == 2
			end

			it "Asignamos valores a posiciones de la matriz" do
				@matrizA[1,1] = 4
				@matrizA[0,1] = 2
				@matrizA.matriz[1][1].should == 4
				@matrizA.matriz[0][1].should == 2
			end
		end
	end
end



