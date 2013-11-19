require 'Matrix'

class SparseVector 
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

class SparseMatrix 

  attr_reader :matrix

  def initialize(h = {})
    @matrix = Hash.new({})
    for k in h.keys do 
      @matrix[k] = if h[k].is_a? SparseVector
                     h[k]
                   else 
                     @matrix[k] = SparseVector.new(h[k])
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
    end
    SparseVector.new c
  end
end
