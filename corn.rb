class Corn
  attr_accessor :quantity, :stock
  def initialize
    @quantity = 0
    @stock = 0
  end

  def crop!
    if @quantity == 0
      "There's no Corn planted yet!" 
    elsif @quantity <= 10
      "Hold On! Faltam 3 semanas p/ colher"
    else
      @stock += @quantity
      @quantity -= @quantity
      
      "Your crop is done! ✅"
    end
  end
end