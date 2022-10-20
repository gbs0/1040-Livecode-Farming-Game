class Rice
  attr_accessor :quantity, :stock
  def initialize
    @quantity = 0
    @stock = 0
  end

  def crop!
    if @quantity == 0
      "There's no Rice planted yet!" 
    elsif @quantity <= 5
      "Hold On! Faltam 2 semanas p/ colher"
    else
      @stock += @quantity
      @quantity -= @quantity
      "Your crop is done! ✅"
    end
  end
end