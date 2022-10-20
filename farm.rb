require_relative 'rice'
require_relative 'corn'
require_relative 'water'

class Farm
  attr_accessor :rice, :corn, :water

  def initialize
    @rice  = Rice.new
    @corn  = Corn.new
    @water = Water.new
  end

  def water!
    @corn.quantity += 5
    @rice.quantity += 2
    @water.quantity -= 5
  end
end