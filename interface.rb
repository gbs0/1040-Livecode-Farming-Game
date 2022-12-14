# DO NOT remove the line below, written for display purpose
require 'cli/ui'

require_relative "farm"
# require_relative "rice"
# require_relative "corn"
# require_relative "cow"
# require_relative "chicken"

@farm = Farm.new
# Display the state of the farm (move the line below in the loop when asked)

def dispatch(action)
  case action
  when "corn"
    CLI::UI::Frame.open('Crop Corn π½') do
      puts @farm.corn.crop!
    end 
  when "rice"
    CLI::UI::Frame.open('Crop Corn π½') do
      puts @farm.rice.crop!
    end 
  when "water"
    CLI::UI::Frame.open('π¦ Water') do
      @farm.water!
      puts "Your plants are now watered! (-5 in Water Stats)"
    end 
  else
    CLI::UI::Frame.open('QUIT') do
      @farm.water!
      puts "Here are your crop status: "
      puts "---------------------------"
      puts "π½ - $5/kg ---------- #{@farm.corn.stock}/kg"
      puts "β’ - $3/kg ---------- #{@farm.rice.stock}/kg"
      if @farm.water.quantity <= 0
        puts "Wait for the next rain season before plating! π§"
      end
      puts "----------- Bye !------------"
      exit
    end 
  end
end

def main
  loop do
    CLI::UI::StdoutRouter.enable
      CLI::UI::Frame.open('Farming Game π·') do
        puts "Current Status: π½ #{@farm.corn.quantity} | β’ #{@farm.rice.quantity} | π¦ #{@farm.water.quantity}"
        CLI::UI::Prompt.ask('What you to do today') do |handler|
            handler.option('π½ Crop Corn')   { |selection| dispatch("corn") }
            handler.option('β’Β Crop Rice')    { |selection| dispatch("rice") }
            handler.option('π¦ Water')  { |selection| dispatch("water") }
            handler.option('Quit')  { |selection| dispatch("quit") }
          end
    end
  end
end

# farm.rice.crop #=> 50 cropped
# 
main()

  

