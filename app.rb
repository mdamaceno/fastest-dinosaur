# frozen_string_literal: true

require File.expand_path('config/environment.rb', __dir__)

dinos_speed = Dinosaur::SpeedCalculation.new
dinos_speed.faster.each do |dino|
  puts dino[:name]
end
