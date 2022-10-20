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
    CLI::UI::Frame.open('Crop Corn 🌽') do
      puts @farm.corn.crop!
    end 
  when "rice"
    CLI::UI::Frame.open('Crop Corn 🌽') do
      puts @farm.rice.crop!
    end 
  when "water"
    CLI::UI::Frame.open('💦 Water') do
      @farm.water!
      puts "Your plants are now watered! (-5 in Water Stats)"
    end 
  else
    CLI::UI::Frame.open('QUIT') do
      @farm.water!
      puts "Here are your crop status: "
      puts "---------------------------"
      puts "🌽 - $5/kg ---------- #{@farm.corn.stock}/kg"
      puts "• - $3/kg ---------- #{@farm.rice.stock}/kg"
      if @farm.water.quantity <= 0
        puts "Wait for the next rain season before plating! 🌧"
      end
      puts "----------- Bye !------------"
      exit
    end 
  end
end

def main
  loop do
    CLI::UI::StdoutRouter.enable
      CLI::UI::Frame.open('Farming Game 🐷') do
        puts "Current Status: 🌽 #{@farm.corn.quantity} | • #{@farm.rice.quantity} | 💦 #{@farm.water.quantity}"
        CLI::UI::Prompt.ask('What you to do today') do |handler|
            handler.option('🌽 Crop Corn')   { |selection| dispatch("corn") }
            handler.option('• Crop Rice')    { |selection| dispatch("rice") }
            handler.option('💦 Water')  { |selection| dispatch("water") }
            handler.option('Quit')  { |selection| dispatch("quit") }
          end
    end
  end
end

# farm.rice.crop #=> 50 cropped
# 
main()

  

