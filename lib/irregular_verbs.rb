class Irregular_Verbs
  def initialize
    @table = {
      :see => [:saw, :seen]
    }
  end

  def [](verb, column = 2)
    if @table[verb.to_sym]
      @table[verb.to_sym][column-2]
    end
  end
end